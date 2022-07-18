package com.human.pj0511;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.human.service.IF_Bbs_service;
import com.human.vo.BbsVO;
import com.human.vo.PageVO;

@Controller
public class BbsController {
	
	@Inject
	IF_Bbs_service bbsService;

	@RequestMapping(value = "/bbsinput", method = RequestMethod.POST) // @ModelAttribute
	public String bbsinput(@ModelAttribute BbsVO bbsvo) throws Exception {

		bbsService.insert(bbsvo);
		return "redirect:/bbslist";
	}
	
	@RequestMapping(value = "/bbslist", method = RequestMethod.GET)
	public String bbsList(Locale locale, Model model, @ModelAttribute PageVO pagevo) throws Exception {

		if (pagevo.getPage() == null) {
			pagevo.setPage(1);
		}
		pagevo.setPerPageNum(10);
		int totalSize = bbsService.selectCnt();
		// select count(*) from bbs04;
		System.out.println(totalSize + "건을 가져왔습니다.");
		pagevo.setTotalCount(totalSize); // 실제는 db와야 하지만 지금은 테스트용으로 135라고 가정하겠다.

		System.out.println("현재 페이지 번호 : " + pagevo.getPage());
		System.out.println("현재 페이지 그룹 시작 번호 " + pagevo.getStartPage());
		System.out.println("현재 페이지 그룹   끝 번호 " + pagevo.getEndPage());
		System.out.println("현재 페이지 글 시간 번호" + pagevo.getStartNo());
		System.out.println("현재 페이지 글 시간 번호" + pagevo.getEndNo());

		model.addAttribute("pagevo", pagevo);// view에게 페이지 정보를 넘겨준다
		// view는 startPage 와 endPage를 이용하여 페이지 그룹을 출력한다.
		// paging end

		List<BbsVO> bbslist = bbsService.selectAll(pagevo); // 파라미터로 pavevo를 넘기도록 수정해야 한다.
		model.addAttribute("bbsList", bbslist); // bbslist의 타입을 분석해 놓는게 좋다.
		return "bbslist";
	}
	
	@RequestMapping(value = "/bbswrite", method = RequestMethod.GET)
	public String bbswrite(Locale locale, Model model) {
		return "bbswriteForm";
	}
	
	@RequestMapping(value = "/delno", method = RequestMethod.GET) // @ModelAttribute
	public String delno(@RequestParam("no") String no) throws Exception {
		// System.out.println("삭제번호 "+no);

		bbsService.deleteOne(no);
		return "redirect:/bbslist";
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET) // @ModelAttribute
	public String viewno(@RequestParam("no") String no, Locale locale, Model model) throws Exception {
		// System.out.println("자세히 보고 싶은 글 번호 "+no);

		BbsVO bbsvo = bbsService.viewDetail(no);
		model.addAttribute("bbsvo", bbsvo);
		return "detailBBS";
	}

	@RequestMapping(value = "/bbsmod", method = RequestMethod.GET) // @ModelAttribute
	public String bbsmod(@RequestParam("no") String no, Locale locale, Model model) throws Exception {
		// System.out.println(no +" 번 수정합니다. get"); // 확인용

		BbsVO bbsvo = bbsService.mod(no);
		model.addAttribute("bbsvo", bbsvo);
		return "bbsmodForm";
	}

	@RequestMapping(value = "/bbsmod", method = RequestMethod.POST) // @ModelAttribute
	public String bbsmodinput(@ModelAttribute BbsVO bbsvo, Locale locale, Model model) throws Exception {
		// System.out.println(bbsvo.getNo() +" 수정합니다. post");
		// System.out.println(bbsvo.getScheck() +" 비밀글 정보");

		bbsService.update(bbsvo);
		return "redirect:/view?no=" + bbsvo.getNo();
	}
}
