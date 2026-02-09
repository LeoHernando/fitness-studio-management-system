package com.leohernando.memberservice.mapper;

import com.leohernando.memberservice.dto.MemberRequestDTO;
import com.leohernando.memberservice.dto.MemberResponseDTO;
import com.leohernando.memberservice.model.Member;

import java.time.LocalDate;

public class MemberMapper {
    public static MemberResponseDTO toDTO(Member member) {
        MemberResponseDTO memberDTO = new MemberResponseDTO();
        memberDTO.setId(member.getId().toString());
        memberDTO.setFirstName(member.getFirstName());
        memberDTO.setLastName(member.getLastName());
        memberDTO.setEmail(member.getEmail());
        memberDTO.setAddress(member.getAddress());
        memberDTO.setPhoneNumber(member.getPhoneNumber());
        memberDTO.setDateOfBirth(member.getDateOfBirth().toString());
        memberDTO.setStatus(member.getStatus());

        return memberDTO;
    }

    public static Member toModel(MemberRequestDTO memberDTO) {
        Member member = new Member();
        member.setFirstName(memberDTO.getFirstName());
        member.setLastName(memberDTO.getLastName());
        member.setEmail(memberDTO.getEmail());
        member.setAddress(memberDTO.getAddress());
        member.setPhoneNumber(memberDTO.getPhoneNumber());
        member.setDateOfBirth(LocalDate.parse(memberDTO.getDateOfBirth()));
        member.setMembershipStartDate(LocalDate.parse(memberDTO.getDateOfBirth()));
        member.setStatus(memberDTO.getStatus());
        return member;
    }
}
