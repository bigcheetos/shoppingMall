package egovframework.let.cop.management.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.management.service.ProductDetailVO;

@Repository("ProductDetailDAO")
public class ProductDetailDAO extends EgovComAbstractDAO{
	
	/**
     * 제품 디테일을 조회 한다.
     *
     * @param String
     * @return ProductDetailVO
     * @throws Exception
     */
	public ProductDetailVO selectProductDetailByProductId(String productId) throws Exception {
		return selectOne("ProductDetailDAO.selectProductDetailByProductId");
	}
	
	/**
     * 제품 디테일을 코드값이 존재하는지 확인하기 위해 code와 일치하는 숫자를 가져온다.
     *
     * @param String
     * @return int
     * @throws Exception
     */
	public int countByProductCode(String productCode) throws Exception {
		return selectOne("ProductDetailDAO.selectCountByProductCode");
	}
	
	/**
     * 제품상세내용을 추가한다.
     *
     * @param ProductDetailVO
     * @return 
     * @throws Exception
     */
	public void insertProductDetail(ProductDetailVO productDetailVO) throws Exception {
		insert("ProductDetailDAO.insertProductDetail", productDetailVO);
	}

	/**
     * 제품상세내용을  수정한다.
     *
     * @param ProductDetailVO
     * @return 
     * @throws Exception
     */
	public void updateProductDetail(ProductDetailVO productDetailVO) throws Exception {
		update("ProductDetailDAO.updateProductDetail", productDetailVO);
	}
	
	/**
     * 제품상세내용을  삭제한다.
     *
     * @param ProductDetailVO
     * @return 
     * @throws Exception
     */
	public void deleteProductDetail(ProductDetailVO productDetailVO) throws Exception {
		delete("ProductDetailDAO.deleteProductDetail", productDetailVO);
	}
	
	// 이미지파일 연결
	/**
     * 제품에 사용된 이미지파일을 추가한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void insertProductDetailToAtchFile(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.insertProductDetailToAtchFile", map);
	}
	
	/**
     * 제품에 사용된 이미지파일을 삭제한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void deleteProductDetailToAtchFile(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.deleteProductDetailToAtchFile", map);
	}
	
	// 카테고리 연결
	/**
     * 제품에 사용된 이미지파일을 추가한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void insertProductDetailToProductCategory(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.insertProductDetailToProductCategory", map);
	}
	
	/**
     * 제품에 사용된 이미지파일을 삭제한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void deleteProductDetailToProductCategory(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.deleteProductDetailToProductCategory", map);
	}
}
