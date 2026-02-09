package com.leohernando.memberservice.service;

import com.leohernando.memberservice.dto.MemberRequestDTO;
import com.leohernando.memberservice.dto.MemberResponseDTO;
import com.leohernando.memberservice.exception.EmailAlreadyExistsException;
import com.leohernando.memberservice.mapper.MemberMapper;
import com.leohernando.memberservice.model.Member;
import com.leohernando.memberservice.repository.MemberRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    private final MemberRepository memberRepository;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public List<MemberResponseDTO> getMembers() {
        List<Member> members = memberRepository.findAll();

        return members.stream().map(MemberMapper::toDTO).toList();
    }

    public MemberResponseDTO createMember(MemberRequestDTO memberRequestDTO) {
        if (memberRepository.existsByEmail(memberRequestDTO.getEmail())) {
            throw new EmailAlreadyExistsException("A member with this email " + "already exists" + memberRequestDTO.getEmail());
        }
        Member newMember = memberRepository.save(MemberMapper.toModel(memberRequestDTO));
        return MemberMapper.toDTO(newMember);
    }
}
