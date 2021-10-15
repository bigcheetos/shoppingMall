package egovframework.let.cop.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovProductDetailService;
import egovframework.let.cop.product.service.ProductDetailVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 상품 상세를 위한 서비스 구현 클래스
 * @author 개발팀 김진영
 * @since 2021.10.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.10.12  김진영          최초 생성
 *
 *  </pre>
 */

@Service("EgovProductDetailService")
public class EgovProductDetailServiceImpl extends EgovAbstractServiceImpl implements EgovProductDetailService{
	@Resource(name = "ProductDetailDAO")
	private ProductDetailDAO productDetailDAO;
	
	/**
     * 상품Id를 통해 상품상세을 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public ProductDetailVO getProductDetailByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		
		return productDetailDAO.selectProductDetailByProductId(productId);
	}
	/**
     * 상품코드가 DB에 있는지 확인한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public boolean checkProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.countByProductCode(productCode)>0;
	}
	
	/**
     * 상품Id가 DB에 있는지 확인한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public boolean checkProductIdFromProductDetail(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.countByProductId(productId)>0;
	}
	
	/**
     * 상품상세정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetail(productDetailVO);
	}

	/**
     * 상품상세정보를 수정한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void modifyProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.updateProductDetail(productDetailVO);
	}
	/**
     * 상품상세정보를 삭제한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void removeProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetail(productDetailVO);
	}
	/** 이미지 관련 시작 **/
	
	/**
     * 상품Id를 통해 상품의 대표 이미지를 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public Map<String, Object> getMainImgByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectMainImgByProductId(productId);
	}
	/**
     * 상품코드를 통해 상품 이미지목록을 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getImgFileListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectImgFileListByProductCode(productCode);
	}
	/**
     * 상품에 사용된 이미지파일의 정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetailToAtchFile(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToAtchFile(map);
	}
	/**
     * 상품에 사용된 이미지파일의 정보를 삭제한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void removeProductDetailToAtchFile(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetailToAtchFile(map);
	}
	/**
     * 상품Id를 이용해 상품에 사용된 이미지파일 목록을 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getImgListByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectImgListByProductId(productId);
	}
	
	/** 이미지 관련 끝 **/
	/** 카테고리 관련 시작 **/
	
	/**
     * 상품Id를 통해 상품에 체크된 카테고리 목록을 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getCheckedCategoryListByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectCheckedCategoryListByProductId(productId);
	}
	/**
     * 상품코드를 통해 상품에 체크된 카테고리 목록을 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getCheckedCategoryListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectCheckedCategoryListByProductCode(productCode);
	}
	/**
     * 상품에 사용된 카테고리의 정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetailToProductCategory(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToProductCategory(map);
	}
	/**
     * 상품에 사용된 카테고리의 정보를 삭제한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void removeProductDetailToProductCategory(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetailToProductCategory(map);
	}
	
	/** 카테고리 관련 끝 **/
	/** 옵션 관련 시작 **/
	
	/**
     * 상품Id를 통해 상품의 옵션 목록을 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getOptionListByOptionId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectOptionListByProductId(productId);
	}
	/**
     * 상품코드를 통해 상품의 옵션 목록를 조회한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getOptionListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectOptionListByProductCode(productCode);
	}
	/**
     * 상품에 사용된 옵션의 정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetailToProductOption(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToProductOption(map);
		
	}
	/**
     * 상품에 사용된 옵션의 정보를 삭제한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void removeProductDetailToProductOption(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetailToProductOption(map);
	}
	
	/** 옵션 관련 끝 **/
}
