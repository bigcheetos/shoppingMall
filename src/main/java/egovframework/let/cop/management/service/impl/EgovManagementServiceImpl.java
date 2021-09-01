package egovframework.let.cop.management.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.cop.management.service.EgovManagementService;
import egovframework.let.cop.management.service.ProductCategoryVO;
import egovframework.let.cop.management.service.ProductTypeVO;
import egovframework.let.cop.management.service.StockIoVO;
import egovframework.let.cop.management.service.StockVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 카테고리 관리를 위한 서비스 구현 클래스
 * @author 개발팀 김진영
 * @since 2021.08.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2021.08.25  김진영          최초 생성
 *
 *  </pre>
 */

@Service("EgovManagementService")
public class EgovManagementServiceImpl extends EgovAbstractServiceImpl implements EgovManagementService {
	
	@Resource(name = "ProductCategoryDAO")
	private ProductCategoryDAO productCategoryDAO;
	
	@Resource(name = "ProductTypeDAO")
	private ProductTypeDAO productTypeDAO;
	
	@Resource(name = "StockDAO")
	private StockDAO stockDAO;
	
	@Resource(name = "StockIoDAO")
	private StockIoDAO stockIoDAO;

	/**
     * 모든 카테고리를 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductCategoryVO> getCategoryListAll() throws Exception {
		// TODO Auto-generated method stub
		return productCategoryDAO.selectCategoryListAll();
	}

	/**
     * 카테고리 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getCategoryNextId() throws Exception {
		// TODO Auto-generated method stub
		return productCategoryDAO.selecNextId();
	}
	
	/**
     * 카테고리를 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addCategory(egovframework.let.cop.management.service.ProductCategoryVO)
     */
	@Override
	public void addCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.insertCategory(productCategoryVO);
	}
	
	/**
     * 카테고리를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyCategory(egovframework.let.cop.management.service.ProductCategoryVO)
     */
	@Override
	public void modifyCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.updateCategory(productCategoryVO);
	}
	
	/**
     * 카테고리를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeCategory(egovframework.let.cop.management.service.ProductCategoryVO)
     */
	@Override
	public void removeCategory(ProductCategoryVO productCategoryVO) throws Exception {
		// TODO Auto-generated method stub
		productCategoryDAO.deleteCategory(productCategoryVO);
	}
	
	/**
     * 모든 타입을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<ProductTypeVO> getTypeListAll() throws Exception {
		// TODO Auto-generated method stub
		return productTypeDAO.selectTypeListAll();
	}

	/**
     * 타입 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getTypeNextId() throws Exception {
		// TODO Auto-generated method stub
		return productTypeDAO.selecNextId();
	}
	
	/**
     * 타입을 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addType(egovframework.let.cop.management.service.ProductTypeVO)
     */
	@Override
	public void addType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.insertType(productTypeVO);
	}
	
	/**
     * 타입을 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyType(egovframework.let.cop.management.service.ProductTypeVO)
     */
	@Override
	public void modifyType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.updateType(productTypeVO);
	}
	
	/**
     * 타입을 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeType(egovframework.let.cop.management.service.ProductTypeVO)
     */
	@Override
	public void removeType(ProductTypeVO productTypeVO) throws Exception {
		// TODO Auto-generated method stub
		productTypeDAO.deleteType(productTypeVO);
	}


	/**
     * 모든 재고를 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockVO> getStockListAll() throws Exception {
		// TODO Auto-generated method stub
		return stockDAO.selectStockListAll();
	}

	/**
     * 재고 Id의 다음 값을 조회 한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getStockNextId() throws Exception {
		// TODO Auto-generated method stub
		return stockDAO.selecNextId();
	}
	
	/**
     * 재고를 추가한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #addStock(egovframework.let.cop.management.service.StockVO)
     */
	@Override
	public void addStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.insertStock(stockVO);
	}
	
	/**
     * 재고를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.StockVO)
     */
	@Override
	public void modifyStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.updateStock(stockVO);
	}
	
	/**
     * 재고를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeStock(egovframework.let.cop.management.service.StockVO)
     */
	@Override
	public void removeStock(StockVO stockVO) throws Exception {
		// TODO Auto-generated method stub
		stockDAO.deleteStock(stockVO);
	}
	
	
	/**
     * 재고에 대한 입출고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockIoListByStockId(StockIoVO stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockIoListByStockId(stockId);
	}

	/**
     * 재고에 대한 입고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockInputListByStockId(String stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockInputListByStockId(stockId);
	}
	
	/**
     * 재고에 대한 입고 목록을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public List<StockIoVO> getStockOutputListByStockId(String stockId) throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selectStockOutputListByStockId(stockId);
	}
	
	/**
     * 입출고 Id의 다음 값을 조회한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     */
	@Override
	public String getStockIoNextId() throws Exception {
		// TODO Auto-generated method stub
		return stockIoDAO.selecNextId();
	}
	
	/**
     * 입출고를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.StockIoVO)
     */
	@Override
	public void addStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.insertStockIo(stockIoVO);
	}
	
	/**
     * 입출고를 수정한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #modifyStock(egovframework.let.cop.management.service.StockIoVO)
     */
	@Override
	public void modifyStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.updateStockIo(stockIoVO);
	}
	
	/**
     * 입출고를 삭제한다.
     *
     * @see egovframework.let.cop.management.service.EgovManagementService
     * #removeStock(egovframework.let.cop.management.service.StockIoVO)
     */
	@Override
	public void removeStockIo(StockIoVO stockIoVO) throws Exception {
		// TODO Auto-generated method stub
		stockIoDAO.deleteStockIo(stockIoVO);
	}
	
}
