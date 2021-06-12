package org.mybatis.presentation;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.domain.Account;
import org.mybatis.domain.Favorite;
import org.mybatis.domain.History;
import org.mybatis.domain.Shop;
import org.mybatis.service.ShopService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	@Resource
	private ShopService shopService;

	/* 가게 목록 조회 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Shop shop) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/shop/list");

		// 서비스 객체 호출
		List<Shop> listShop = this.shopService.find(shop);
		modelAndView.addObject("listShop", listShop);

		return modelAndView;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(HttpServletRequest request, Shop shop) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/shop/store_detail");
		Shop shopDetail = new Shop();

		shopDetail = this.shopService.detail(shop);

		if(request.getSession(false) != null && request.getSession().getAttribute("user") != null) {
			List<History> listHistory = new ArrayList<History>();
			List<Favorite> listFavorite = new ArrayList<Favorite>();
			History history = new History();
			Favorite favorite = new Favorite();
			Account session = (Account)request.getSession().getAttribute("user");
			
			history.setId(session.getId());
			favorite.setId(session.getId());
			
			listHistory = this.shopService.select_history(history);
			listFavorite= this.shopService.select_favorite(favorite);
			
			modelAndView.addObject("listHistory", listHistory);
			modelAndView.addObject("listFavorite", listFavorite);
			
		}

		modelAndView.addObject("listShop", shopDetail);
		return modelAndView;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView insert(HttpServletRequest request, Favorite favorite) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		List<Favorite> listFavorite = new ArrayList<Favorite>();
		String url = favorite.getHrefURL().split("localhost")[1];
		modelAndView.setViewName("redirect:" + url);
		
			Account session = (Account) request.getSession().getAttribute("user");
			
			favorite.setHrefURL(URLDecoder.decode(favorite.getHrefURL(), "utf-8"));
			favorite.setId(session.getId());
			listFavorite= this.shopService.select_favorite(favorite);
			
			for(Favorite checkFav : listFavorite) {
				if(checkFav.getId().equals(favorite.getId()) && checkFav.getShopName().equals(favorite.getShopName()) && checkFav.getAddress().equals(favorite.getAddress())) {
					this.shopService.delete_favorite(favorite);
					return modelAndView;
				}
			}
			this.shopService.insert_favorite(favorite);
		
			return modelAndView;
	}

	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, Shop shop) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/shop/index");
		List<Shop> listShop = new ArrayList<Shop>();
		
		
		if(shop.getShopType() != null) {
			listShop = this.shopService.find(shop);
			if(request.getSession(false) != null && request.getSession().getAttribute("user") != null) {
				History history = new History();
				Account session = (Account)request.getSession().getAttribute("user");
				String hrefURL = request.getRequestURL().toString() + "?" + request.getQueryString();
				
				
				history.setHrefURL(URLDecoder.decode(hrefURL, "utf-8"));
				history.setId(session.getId());
				history.setShopType(request.getParameter("shopType"));
				history.setSectors(Integer.parseInt(request.getParameter("sectors")));
				history.setAddress(request.getParameter("address"));
				
				this.shopService.insert_history(history);

			}
		}
		
		if(request.getSession(false) != null && request.getSession().getAttribute("user") != null) {
			List<History> listHistory = new ArrayList<History>();
			List<Favorite> listFavorite = new ArrayList<Favorite>();
			History history = new History();
			Favorite favorite = new Favorite();
			Account session = (Account)request.getSession().getAttribute("user");
			

			history.setId(session.getId());
			favorite.setId(session.getId());
			
			listHistory = this.shopService.select_history(history);
			listFavorite= this.shopService.select_favorite(favorite);
			
			modelAndView.addObject("listHistory", listHistory);
			modelAndView.addObject("listFavorite", listFavorite);
			
		}
		
		modelAndView.addObject("listShop", listShop);
		

		return modelAndView;
	}

	/* 가게 삭제 */
	@RequestMapping(value = "/delete/{hisNo}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable String hisNo) throws Exception {
		RedirectView redirectView = new RedirectView("/shop/index");
		redirectView.setExposeModelAttributes(false);
		// 서비스 객체 호출
		this.shopService.delete_history(hisNo);
		
		return new ModelAndView(redirectView);
	}
	
	@RequestMapping(value = "/deleteFav}", method = RequestMethod.GET)
	public void removeFav(Favorite favorite) throws Exception {
		RedirectView redirectView = new RedirectView("/shop/index");
		redirectView.setExposeModelAttributes(false);

		// 서비스 객체 호출
		this.shopService.delete_favorite(favorite);
	}
}