package com.leohernando.memberservice.service;

import com.leohernando.memberservice.dto.MemberResponseDTO;
import com.leohernando.memberservice.mapper.MemberMapper;
import com.leohernando.memberservice.model.Member;
import com.leohernando.memberservice.repository.MemberRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MemberService {
    private final MemberRepository memberRepository;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public List<MemberResponseDTO> getMembers() {
        List<Member> members = memberRepository.findAll();
        List<MemberResponseDTO> memberResponseDTOs = members.stream().map(
                MemberMapper::toDTO).toList();

        return memberResponseDTOs;
    }
}
