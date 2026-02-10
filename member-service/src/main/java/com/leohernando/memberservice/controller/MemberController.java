package com.leohernando.memberservice.controller;

import com.leohernando.memberservice.dto.MemberRequestDTO;
import com.leohernando.memberservice.dto.MemberResponseDTO;
import com.leohernando.memberservice.dto.validators.CreateMemberValidationGroup;
import com.leohernando.memberservice.service.MemberService;
import jakarta.validation.Valid;
import jakarta.validation.groups.Default;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

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
    public ResponseEntity<MemberResponseDTO> createMember(@Validated({Default.class, CreateMemberValidationGroup.class})
                                                              @RequestBody MemberRequestDTO memberRequestDTO) {
        MemberResponseDTO memberResponseDTO = memberService.createMember(memberRequestDTO);
        return ResponseEntity.ok(memberResponseDTO);
    }

    @PutMapping("/{id}")
    public ResponseEntity<MemberResponseDTO> updateMember(@PathVariable UUID id,
                                                          @Validated({Default.class}) @RequestBody MemberRequestDTO memberRequestDTO) {
        MemberResponseDTO memberResponseDTO = memberService.updateMember(id,
                memberRequestDTO);

        return ResponseEntity.ok(memberResponseDTO);
    }
}
