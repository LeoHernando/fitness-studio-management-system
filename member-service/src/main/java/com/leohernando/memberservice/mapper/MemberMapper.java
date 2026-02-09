package com.leohernando.memberservice.mapper;

import com.leohernando.memberservice.dto.MemberResponseDTO;
import com.leohernando.memberservice.model.Member;

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
}
