package com.leohernando.memberservice.controller;

import com.leohernando.memberservice.dto.MemberRequestDTO;
import com.leohernando.memberservice.dto.MemberResponseDTO;
import com.leohernando.memberservice.service.MemberService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping
    public ResponseEntity<List<MemberResponseDTO>> getAllMembers() {
        List<MemberResponseDTO> members = memberService.getMembers();
        return ResponseEntity.ok(members);
    }

    @PostMapping
    public ResponseEntity<MemberResponseDTO> createMember(@Valid @RequestBody MemberRequestDTO memberRequestDTO) {
        MemberResponseDTO memberResponseDTO = memberService.createMember(memberRequestDTO);
        return ResponseEntity.ok(memberResponseDTO);
    }
}
