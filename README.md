# Gym Booking Microservices System

A production-ready Spring Boot microservices-based gym class booking and member management system. This project demonstrates modern microservices architecture patterns including service discovery, API gateway, gRPC inter-service communication, event-driven messaging with Kafka, and cloud deployment on AWS.

## 🏗️ System Architecture

### Development Architecture (Docker Network)
```
┌─────────────────────────────────────────────────────────────┐
│                      Docker Network                         │
│                                                             │
│  ┌──────────┐      ┌─────────────┐                          │
│  │Frontend  │─────▶│ API Gateway │                         │
│  │(Client)  │      │             │                         │
│  └──────────┘      └──────┬──────┘                         │
│                           │                                │
│         ┌─────────────────┼─────────────────┐              │
│         │                 │                 │              │
│    ┌────▼─────┐    ┌─────▼──────┐   ┌─────▼──────┐         │
│    │  Auth    │    │  Member    │   │   Class    │         │
│    │ Service  │    │  Service   │   │  Booking   │         │
│    │          │    │            │   │  Service   │         │
│    └────┬─────┘    └─────┬──────┘   └─────┬──────┘         │
│         │                │   ▲             │              │
│         │                │   │ gRPC        │              │
│         │                │   └─────────────┘              │
│         │                │                                │
│         │          ┌─────┴──────┐                         │
│         │          │   Kafka    │                         │
│         │          │  Producer  │                         │
│         │          └─────┬──────┘                         │
│         │                │                                │
│         └────────────────┼─────────────────┘              │
│                          │                                │
│              ┌───────────┴──────────────┐                 │
│              │    Kafka Message Bus     │                 │
│              │ Topics: member-events,   │                 │
│              │        booking-events    │                 │
│              └───────────┬──────────────┘                 │
│                          │                                │
│              ┌───────────┴──────────────┐                 │
│              │                          │                 │
│        ┌─────▼──────┐          ┌───────▼────────┐        │
│        │ Analytics  │          │ Notification   │        │
│        │  Service   │          │   Service      │        │
│        │(Kafka      │          │(Kafka          │        │
│        │Consumer)   │          │Consumer)       │        │
│        └────────────┘          └────────────────┘        │
└──────────────────────────────────────────────────────────┘
```

### Production Architecture (AWS)
```
┌────────────────────────────────────────────────────────────┐
│                        AWS Cloud                           │
│                                                            │
│  ┌──────────────┐                                          │
│  │   Frontend   │        ┌─────────────────────────────┐   │
│  │    Client    │───────▶│      ECS Cluster            │  │
│  └──────────────┘        │                             │  │
│         │                │  ┌──────────────────────┐   │  │
│         │                │  │ Auth Service (Task)  │   │  │
│         ▼                │  └──────────────────────┘   │  │
│  ┌──────────────┐        │                             │  │
│  │ Application  │        │  ┌──────────────────────┐   │  │
│  │     Load     │───────▶│  │Member Service (Task) │   │  │
│  │  Balancer    │        │  │+ gRPC Client         │   │  │
│  │ (ALB-Public) │        │  │+ Kafka Producer      │   │  │
│  └──────┬───────┘        │  └──────────────────────┘   │  │
│         │                │                             │  │
│         │                │  ┌──────────────────────┐   │  │
│         ▼                │  │Class Booking Service │   │  │
│  ┌──────────────┐        │  │(Task) + gRPC Server  │   │  │
│  │  API Gateway │        │  └──────────────────────┘   │  │
│  │  (ECS Task)  │        │                             │  │
│  └──────────────┘        │  ┌──────────────────────┐   │  │
│                          │  │Analytics Service     │   │  │
│                          │  │(Task) + Kafka        │   │  │
│                          │  │Consumer              │   │  │
│         ┌────────────────┤  └──────────────────────┘   │  │
│         │                │                             │  │
│         │                │  ┌──────────────────────┐   │  │
│         │                │  │Notification Service  │   │  │
│         │                │  │(Task) + Kafka        │   │  │
│         │                │  │Consumer              │   │  │
│         │                │  └──────────────────────┘   │  │
│         │                └─────────────────────────────┘  │
│         │                                                 │
│         │                ┌─────────────────────────────┐ │
│         │                │         RDS                 │ │
│         │                │  ┌──────────────┐           │ │
│         └───────────────▶│  │ Auth Service │           │ │
│                          │  │      DB      │           │ │
│                          │  ├──────────────┤           │ │
│                          │  │Member Service│           │ │
│                          │  │      DB      │           │ │
│                          │  ├──────────────┤           │ │
│                          │  │Booking       │           │ │
│                          │  │Service DB    │           │ │
│                          │  └──────────────┘           │ │
│                          └─────────────────────────────┘ │
│                                                          │
│                          ┌─────────────────────────────┐ │
│                          │  MSK (Private Subnet)       │ │
│                          │                             │ │
│                          │  📨 member-events topic     │ │
│                          │  📨 booking-events topic    │ │
│                          └─────────────────────────────┘ │
└──────────────────────────────────────────────────────────┘
```

## 🚀 Services Overview

### Auth Service 
- JWT-based authentication and authorization
- Member registration and login
- Token validation and refresh
- **Database**: PostgreSQL (`auth_db`)

### Member Service 
- Manages gym member profiles and memberships
- Membership status tracking (ACTIVE, EXPIRED, SUSPENDED)
- Publishes events to Kafka on member registration/updates
- Exposes gRPC endpoints for member validation
- **Database**: PostgreSQL (`member_db`)
- **Event Publishing**: `member.registered`, `member.updated`

### Class Booking Service 
- Manages class schedules and bookings
- Capacity management and waitlist handling
- Validates member eligibility via gRPC calls to Member Service
- Publishes booking events to Kafka
- **Database**: PostgreSQL (`booking_db`)
- **Event Publishing**: `class.booked`, `class.cancelled`
- **gRPC Client**: Calls Member Service for validation

### Notification Service 
- Consumes events from Kafka message bus
- Sends booking confirmations via email/SMS
- Sends class reminders 24 hours before class
- Sends membership renewal notifications
- **Event Consumption**: All member and booking events

### Analytics Service 
- Consumes events from Kafka for real-time analytics
- Tracks popular classes and attendance patterns
- Generates reports on member engagement
- Provides insights on peak booking times
- **Event Consumption**: All member and booking events

### API Gateway 
- Single entry point for all client requests
- Request routing to appropriate microservices
- Load balancing and rate limiting
- Centralized authentication validation

## 🛠️ Tech Stack

### Backend
- **Framework**: Spring Boot 3.4.1
- **Language**: Java 17+
- **API Gateway**: Spring Cloud Gateway
- **Inter-Service Communication**: gRPC (synchronous), Kafka (async)
- **Message Queue**: Apache Kafka
- **Database**: PostgreSQL (separate DB per service)
- **Build Tool**: Maven

### DevOps & Infrastructure
- **Containerization**: Docker & Docker Compose
- **Cloud Platform**: AWS (ECS, RDS, MSK, ALB)

## 📋 Prerequisites

- **Java 17** or higher
- **Maven 3.6+**
- **Docker & Docker Compose**
- **PostgreSQL** (or use Docker)
- **Node.js 16+** (for frontend, if applicable)



## 📚 Learning Objectives

This project demonstrates:
- ✅ **Microservices Architecture** - Service decomposition and bounded contexts
- ✅ **Service-to-Service Communication** - REST, gRPC, Kafka
- ✅ **Service Discovery** - Eureka Server
- ✅ **API Gateway Pattern** - Single entry point, routing, load balancing
- ✅ **Database per Service** - Data isolation and independence
- ✅ **Event-Driven Architecture** - Kafka for async communication
- ✅ **Docker Containerization** - Multi-container applications
- ✅ **Cloud Deployment** - AWS ECS, RDS, MSK
- ✅ **RESTful API Design** - Resource-based endpoints
- ✅ **Security** - JWT authentication and authorization


## 📈 Performance Considerations

- **Database Indexing**: Optimized queries on member_id, class_id, status fields
- **Connection Pooling**: HikariCP for database connections
- **Caching Strategy**: Redis for member profiles and class schedules
- **Async Processing**: Kafka for non-blocking operations
- **Load Balancing**: Nginx/ALB for distributing traffic
- **Horizontal Scaling**: Stateless services allow easy scaling

## 🔒 Security Best Practices

- JWT token-based authentication
- Password hashing with BCrypt
- HTTPS/TLS for all communications
- Input validation and sanitization
- Rate limiting on API endpoints
- SQL injection prevention (JPA/Hibernate)
- CORS configuration
- Environment-based secrets management

## 👤 Author

**Leo**
- GitHub: [@LeoHernando](https://github.com/LeoHernando)
- LinkedIn: [LeoHernando](https://linkedin.com/in/leohernando)
- Email: l.hernando.tan@gmail.com
---

⭐ **Star this repo if you found it helpful!**

