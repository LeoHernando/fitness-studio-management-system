package com.leohernando.analyticsservice.kafka;

import com.google.protobuf.InvalidProtocolBufferException;
import member.events.MemberEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumer {

    private static final Logger log = LoggerFactory.getLogger(KafkaConsumer.class);

    @KafkaListener(topics = "member", groupId = "analytics-service")
    public void consumeEvent(byte[] event) {
        try {
            MemberEvent memberEvent = MemberEvent.parseFrom(event);
            // ... perform any business related to analytics here

            log.info("Received Member Event: [MemberId={}, MemberName={},MemberEmail={}]", memberEvent.getMemberId(), memberEvent.getName(), memberEvent.getEmail());
        } catch (InvalidProtocolBufferException e) {
            log.error("Error deserializing event {}", e.getMessage());
        }
    }
}
