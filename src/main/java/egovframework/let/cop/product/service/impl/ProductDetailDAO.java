package egovframework.let.cop.product.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.product.service.ProductDetailVO;

@Repository("ProductDetailDAO")
public class ProductDetailDAO extends EgovComAbstractDAO{
	
	/**
     * 상품상세정보을 조회한다.
     *
     * @param String
     * @return ProductDetailVO
     * @throws Exception
     */
	public ProductDetailVO selectProductDetailByProductId(String productId) throws Exception {
		return selectOne("ProductDetailDAO.selectProductDetailByProductId", productId);
	}

	/**
     * 상품상세정보에 상품Id값이 일치하는 수를 가져온다.
     *
     * @param String
     * @return int
     * @throws Exception
     */
	public int countByProductId(String productId) throws Exception {
		return selectOne("ProductDetailDAO.selectCountByProductId", productId);
	}
	
	/**
     * 상품상세정보에 상품코드값이 일치하는 수를 가져온다.
     *
     * @param String
     * @return int
     * @throws Exception
     */
	public int countByProductCode(String productCode) throws Exception {
		return selectOne("ProductDetailDAO.selectCountByProductCode", productCode);
	}
	
	/**
     * 상품상세정보를 추가한다.
     *
     * @param ProductDetailVO
     * @return 
     * @throws Exception
     */
	public void insertProductDetail(ProductDetailVO productDetailVO) throws Exception {
		insert("ProductDetailDAO.insertProductDetail", productDetailVO);
	}

	/**
     * 상품상세정보를  수정한다.
     *
     * @param ProductDetailVO
     * @return 
     * @throws Exception
     */
	public void updateProductDetail(ProductDetailVO productDetailVO) throws Exception {
		update("ProductDetailDAO.updateProductDetail", productDetailVO);
	}
	
	/**
     * 상품상세정보를  삭제한다.
     *
     * @param ProductDetailVO
     * @return 
     * @throws Exception
     */
	public void deleteProductDetail(ProductDetailVO productDetailVO) throws Exception {
		delete("ProductDetailDAO.deleteProductDetail", productDetailVO);
	}
	
	/** 카테고리 관련 시작 **/
	/**
     * 상품Id를 통해 체크된 카테고리 목록을 조회한다.
     *
     * @param String
     * @return List
     * @throws Exception
     */
	public List<Map<String, Object>> selectCheckedCategoryListByProductId(String productId) throws Exception {
		return selectList("ProductDetailDAO.selectCheckedCategoryListByProductId", productId);
	}
	
	/**
     * 상품코드를 통해 체크된 카테고리 목록을 조회한다.
     *
     * @param String
     * @return Map<String, Object>
     * @throws Exception
     */
	public List<Map<String, Object>> selectCheckedCategoryListByProductCode(String productCode) throws Exception {
		return selectList("ProductDetailDAO.selectCheckedCategoryListByProductCode", productCode);
	}
	
	/**
     * 상품에 체크된 카테고리 정보를 추가한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void insertProductDetailToProductCategory(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.insertProductDetailToProductCategory", map);
	}
	
	/**
     * 상품에 체크된 카테고리 정보를 삭제한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void deleteProductDetailToProductCategory(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.deleteProductDetailToProductCategory", map);
	}
	/** 카테고리 관련 끝 **/
	
	/** 이미지 관련 시작 **/
	/**
     * 상품Id를 통해 대표 이미지를 조회한다.
     *
     * @param String
     * @return Map<String, Object>
     * @throws Exception
     */
	public Map<String, Object> selectMainImgByProductId(String productId) throws Exception {
		return selectOne("ProductDetailDAO.selectMainImgByProductId", productId);
	}

	/**
     * 상품Id를 통해 이미지파일 목록을 조회한다.
     *
     * @param String
     * @return List
     * @throws Exception
     */
	public List<Map<String, Object>> selectImgListByProductId(String productId) throws Exception {
		return selectList("ProductDetailDAO.selectImgListByProductId", productId);
	}
	
	/**
     * 상품코드를 통해 이미지파일 목록을 조회한다.
     *
     * @param String
     * @return List
     * @throws Exception
     */
	public List<Map<String, Object>> selectImgFileListByProductCode(String productCode) throws Exception {
		return selectList("ProductDetailDAO.selectImgFileListByProductCode", productCode);
	}
	
	/**
     * 상품에 사용된 이미지파일을 추가한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void insertProductDetailToAtchFile(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.insertProductDetailToAtchFile", map);
	}
	
	/**
     * 상품에 사용된 이미지파일을 삭제한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void deleteProductDetailToAtchFile(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.deleteProductDetailToAtchFile", map);
	}
	/** 이미지 관련 끝 **/
	/** 옵션 관련 시작 **/
	/**
     * 상품Id를 통해 옵션목록을 조회한다.
     *
     * @param String
     * @return Map<String, Object>
     * @throws Exception
     */
	public List<Map<String, Object>> selectOptionListByProductId(String productId) throws Exception {
		return selectList("ProductDetailDAO.selectOptionListByProductId", productId);
	}
	
	/**
     * 상품코드를 통해 옵션목록을 조회한다.
     *
     * @param String
     * @return Map<String, Object>
     * @throws Exception
     */
	public List<Map<String, Object>> selectOptionListByProductCode(String productCode) throws Exception {
		return selectList("ProductDetailDAO.selectOptionListByProductCode", productCode);
	}
	
	/**
     * 상품에 사용된 옵션을 추가한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void insertProductDetailToProductOption(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.insertProductDetailToProductOption", map);
	}
	
	/**
     * 상품에 사용된 옵션을 삭제한다.
     *
     * @param Map<String, String> map
     * @return 
     * @throws Exception
     */
	public void deleteProductDetailToProductOption(Map<String, String> map) throws Exception {
		insert("ProductDetailDAO.deleteProductDetailToProductOption", map);
	}
	
	/** 옵션 관련 끝 **/
}
