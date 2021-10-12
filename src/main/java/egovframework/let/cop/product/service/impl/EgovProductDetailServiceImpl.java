package egovframework.let.cop.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.product.service.EgovProductDetailService;
import egovframework.let.cop.product.service.ProductDetailVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 제품 상세를 위한 서비스 구현 클래스
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
     * 제품상세을 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public ProductDetailVO getProductDetailByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		
		return productDetailDAO.selectProductDetailByProductId(productId);
	}
	/**
     * 제품코드가 있는지 확인한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public boolean checkProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.countByProductCode(productCode)>0;
	}
	
	/**
     * 제품Id가 있는지 확인한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public boolean checkProductIdFromProductDetail(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.countByProductId(productId)>0;
	}
	
	/**
     * 제품 상세 정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetail(productDetailVO);
	}

	/**
     * 제품 상세 정보를 수정한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void modifyProductDetail(ProductDetailVO productDetailVO) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.updateProductDetail(productDetailVO);
	}
	/**
     * 제품 상세 정보를 삭제한다.
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
     * 제품Id를 이용해 제품에 대표 이미지를 가져온다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public Map<String, Object> getMainImgByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectMainImgByProductId(productId);
	}
	/**
     * 제품상세와 연결된 이미지파일을 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getImgFileListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectImgFileListByProductCode(productCode);
	}
	/**
     * 제품상세정보에 사용된 이미지파일의 연결정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetailToAtchFile(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToAtchFile(map);
	}
	/**
     * 제품상세정보에 사용된 이미지파일의 연결정보를 삭제한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void removeProductDetailToAtchFile(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.deleteProductDetailToAtchFile(map);
	}
	/**
     * 제품Id를 이용해 제품에 포함된 이미지 파일 목록을 가져온다.
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
     * 제품Id를 이용해 제품에 체크된 카테고리 목록을 가져온다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getCheckedCategoryListByProductId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectCheckedCategoryListByProductId(productId);
	}
	/**
     * 제품상세와 연결된 카테고리를 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getCheckedCategoryListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectCheckedCategoryListByProductCode(productCode);
	}
	/**
     * 제품상세정보에 사용된 카테고리의 연결정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetailToProductCategory(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToProductCategory(map);
	}
	/**
     * 제품상세정보에 사용된 카테고리의 연결정보를 삭제한다.
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
     * 제품Id를 이용해 제품에 포함된 옵션 목록을 가져온다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getOptionListByOptionId(String productId) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectOptionListByProductId(productId);
	}
	/**
     * 제품상세와 연결된 옵션를 조회 한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public List<Map<String, Object>> getOptionListByProductCode(String productCode) throws Exception {
		// TODO Auto-generated method stub
		return productDetailDAO.selectOptionListByProductCode(productCode);
	}
	/**
     * 제품상세정보에 사용된 옵션의 연결정보를 추가한다.
     *
     * @see egovframework.let.cop.product.service.EgovProductDetailService
     */
	@Override
	public void addProductDetailToProductOption(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		productDetailDAO.insertProductDetailToProductOption(map);
		
	}
	/**
     * 제품상세정보에 사용된 옵션의 연결정보를 삭제한다.
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
