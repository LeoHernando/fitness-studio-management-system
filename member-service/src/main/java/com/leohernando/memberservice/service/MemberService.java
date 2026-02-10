package com.leohernando.memberservice.service;

import com.leohernando.memberservice.dto.MemberRequestDTO;
import com.leohernando.memberservice.dto.MemberResponseDTO;
import com.leohernando.memberservice.exception.EmailAlreadyExistsException;
import com.leohernando.memberservice.exception.MemberNotFoundException;
import com.leohernando.memberservice.mapper.MemberMapper;
import com.leohernando.memberservice.model.Member;
import com.leohernando.memberservice.repository.MemberRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

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

    public MemberResponseDTO updateMember(UUID id,
                                          MemberRequestDTO memberRequestDTO) {

        Member member = memberRepository.findById(id).orElseThrow(
                () -> new MemberNotFoundException("Patient not found with ID: " + id));

        if (memberRepository.existsByEmailAndIdNot(memberRequestDTO.getEmail(), id)) {
            throw new EmailAlreadyExistsException(
                    "A member with this email " + "already exists"
                            + memberRequestDTO.getEmail());
        }

        member.setFirstName(memberRequestDTO.getFirstName());
        member.setLastName(memberRequestDTO.getLastName());
        member.setEmail(memberRequestDTO.getEmail());
        member.setPhoneNumber(memberRequestDTO.getPhoneNumber());
        member.setAddress(memberRequestDTO.getAddress());
        member.setDateOfBirth(LocalDate.parse(memberRequestDTO.getDateOfBirth()));
        if (memberRequestDTO.getMembershipEndDate() != null) {
            member.setMembershipEndDate(LocalDate.parse(memberRequestDTO.getMembershipEndDate()));
        }
        member.setStatus(memberRequestDTO.getStatus());

        Member updatedMember = memberRepository.save(member);
        return MemberMapper.toDTO(updatedMember);
    }
}
