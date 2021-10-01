package egovframework.let.cop.management.service.impl;

import java.util.List;
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
		return selectOne("ProductDetailDAO.selectProductDetailByProductId", productId);
	}
	
	/**
     * 제품 디테일과 연결된 카테고리를 조회 한다.
     *
     * @param String
     * @return Map<String, Object>
     * @throws Exception
     */
	public List<Map<String, Object>> selectProductDetailToProductCategoryByProductCode(String productCode) throws Exception {
		return selectList("ProductDetailDAO.selectProductDetailToProductCategoryByProductCode", productCode);
	}
	
	/**
     * 제품 디테일과 연결된 이미지파일을 조회 한다.
     *
     * @param String
     * @return List
     * @throws Exception
     */
	public List<Map<String, Object>> selectProductDetailToAtchFileByProductCode(String productCode) throws Exception {
		return selectList("ProductDetailDAO.selectProductDetailToAtchFileByProductCode", productCode);
	}

	/**
     * 제품Id를 이용하여 제품 디테일과 연결된 대표 이미지파일만 조회 한다.
     *
     * @param String
     * @return Map<String, Object>
     * @throws Exception
     */
	public Map<String, Object> selectMainImgByProductId(String productId) throws Exception {
		return selectOne("ProductDetailDAO.selectMainImgByProductId", productId);
	}
	
	/**
     * 제품Id를 이용하여 제품 디테일과 연결된 이미지리스트를 조회 한다.
     *
     * @param String
     * @return List
     * @throws Exception
     */
	public List<Map<String, Object>> selectImgListByProductId(String productId) throws Exception {
		return selectList("ProductDetailDAO.selectImgListByProductId", productId);
	}
	
	/**
     * 제품Id를 이용하여 제품 디테일과 연결된 카테고리 리스트를 조회 한다.
     *
     * @param String
     * @return List
     * @throws Exception
     */
	public List<Map<String, Object>> selectCheckedCategoryListByProductId(String productId) throws Exception {
		return selectList("ProductDetailDAO.selectCheckedCategoryListByProductId", productId);
	}
	/**
     * 제품 상세 테이블에 상품코드값이 일치하는 수를 가져온다.
     *
     * @param String
     * @return int
     * @throws Exception
     */
	public int countByProductCode(String productCode) throws Exception {
		return selectOne("ProductDetailDAO.selectCountByProductCode", productCode);
	}
	
	/**
     * 제품 상세 테이블에 상품ID값이 일치하는 수를 가져온다.
     *
     * @param String
     * @return int
     * @throws Exception
     */
	public int countByProductId(String productId) throws Exception {
		return selectOne("ProductDetailDAO.selectCountByProductId", productId);
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
