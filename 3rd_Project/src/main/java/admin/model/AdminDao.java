package admin.model;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import c_board.model.CBoardBean;
import celeb.model.CelebBean;
import company.model.CompanyBean;
import product.model.ProductBean;
import q_board.model.QBoardBean;
import users.model.UsersBean;
import utility.Paging;


@Component("adminDao")
public class AdminDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String nameSpace = "sqlField_admin.";
	
	public AdminDao() {}

	
	//q_board
	public List<QBoardBean> getAllBoardList(Paging pageInfo, Map<String, String> map) {

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		List<QBoardBean> list = sqlSessionTemplate.selectList(nameSpace+"getAllBoardList",map,rowBounds);
		
		return list;
	}
	public boolean findU_id(String u_id) {
		boolean found = false;
		int count = sqlSessionTemplate.selectOne(nameSpace+"findU_id", u_id);
		if(count > 0) {
			found = true;
		}
		return found;
	}
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(nameSpace+"getTotalCount",map);
		return totalCount;
	}

	public QBoardBean selectContent(int q_num) {
		QBoardBean bb = sqlSessionTemplate.selectOne(nameSpace+"selectContent",q_num);
		return bb;
	}

	public void deleteBoard(int q_num) {

		sqlSessionTemplate.delete(nameSpace+"deleteBoard",q_num);
		
	}
	
	
	//c_board
	public List<CBoardBean> getAllBoardListC(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<CBoardBean> list = sqlSessionTemplate.selectList(nameSpace+"getAllBoardListC",map,rowBounds);
		
		return list;
	}
	
	public int getTotalCountC(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(nameSpace+"getTotalCountC",map);
		return totalCount;
	}

	public CBoardBean selectContentC(int c_num) {
		CBoardBean bb = sqlSessionTemplate.selectOne(nameSpace+"selectContentC",c_num);
		return bb;
	}
	
	
	public void deleteBoardC(int c_num) {
		sqlSessionTemplate.delete(nameSpace+"deleteBoardC",c_num);
	}
	
	public void deleteChkBoardC(int[] checks) {
		for(int i=0; i<checks.length; i++) {
			int c_num = checks[i];
			sqlSessionTemplate.delete(nameSpace+"deleteChkBoardC",c_num);
		}
	}
	
	//celeb
	public int getCeleb(Map<String, String> map) {
		
		int cnt = sqlSessionTemplate.selectOne(nameSpace + "getCeleb",map);
		
		return cnt;
	}

	public List<CelebBean> getAllCelebList(Map<String, String> map, Paging pageInfo) {
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		List<CelebBean> lists = sqlSessionTemplate.selectList(nameSpace + "getAllCelebList",map,rowBounds);
		
		return lists;
		
	}
	
	public CelebBean getSelectOneCeleb(int cl_num) {
		CelebBean cb = sqlSessionTemplate.selectOne(nameSpace+"getSelectOneCeleb",cl_num);
			return cb;
		}

	public int insertCeleb(CelebBean bb) {

		return sqlSessionTemplate.insert(nameSpace+"insertCeleb",bb);
		
	}
	public void deleteCeleb(int cl_num) {
		sqlSessionTemplate.delete(nameSpace+"deleteCeleb", cl_num);
	}
	
	public int updateCeleb(CelebBean bb) {
		return sqlSessionTemplate.update(nameSpace+"updateCeleb", bb);
	}
	
	//company
	public List<CompanyBean> getAllCompany(Paging pageInfo, Map<String, String> map) {
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<CompanyBean> list = sqlSessionTemplate.selectList(nameSpace+"getAllCompany", map, rowBounds);
		
		return list;
	}
	
	public int getTotalCountCompany(Map<String, String> map) {
		 
		int totalCount = sqlSessionTemplate.selectOne(nameSpace+"getTotalCountCompany", map);

		return totalCount;
	}

	public CompanyBean getSelectOneCompany(int cmp_num) {
		
		CompanyBean cb = sqlSessionTemplate.selectOne(nameSpace+"getSelectOneCompany", cmp_num);
		
		return cb;
	}
	
	public void insertCompany(CompanyBean bb) {

		sqlSessionTemplate.insert(nameSpace+"insertCompany",bb);
		
	}
	
	public void deleteCompany(int cmp_num) {
		sqlSessionTemplate.delete(nameSpace+"deleteCompany", cmp_num);
	}
	

	public int updateCompany(CompanyBean bb) {
		return sqlSessionTemplate.update(nameSpace+"updateCompany", bb);
	}
	
	
	//users
	public List<UsersBean> getUsers(Map<String, String> map) {
//		System.out.println("getUsers로 넘어온 키워드:"+map.get("keyword"));
//		if(map.get("keyword").equals("%null%")) {
//			map.put("keyword", null);
//		}
//		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
//		return sqlSessionTemplate.selectList(nameSpace+"getUsers", map, rowBounds);
		return sqlSessionTemplate.selectList(nameSpace+"getUsers", map);
	}
	
	public int getTotalUserCount(Map<String, String> map) {
		System.out.println("getTotalUserCount로 넘어온 키워드:"+map.get("keyword"));
		return sqlSessionTemplate.selectOne(nameSpace+"getTotalUserCount", map);
	}
	
	public void deleteUsers(String u_id) {
		sqlSessionTemplate.delete(nameSpace+"deleteUsers", u_id);
	}

	public UsersBean getUserById(String u_id) {
		return sqlSessionTemplate.selectOne(nameSpace+"getUserById", u_id);
	}

	
	//product
	public List<ProductBean> getProducts(Map<String, String> map, Paging pageInfo) {
		System.out.println("getProducts로 넘어온 키워드:"+map.get("keyword"));
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(nameSpace+"getProducts", map, rowBounds);
	}

	public int getTotalPrdCount(Map<String, String> map) {
		System.out.println("getTotalPrdCount로 넘어온 키워드:"+map.get("keyword"));
		return sqlSessionTemplate.selectOne(nameSpace+"getTotalPrdCount", map);
	}

	public int deleteProduct(String p_num) {
		return sqlSessionTemplate.delete(nameSpace+"deleteProduct", p_num);
	}

	public ProductBean getProductByNum(String p_num) {
		return sqlSessionTemplate.selectOne(nameSpace+"getProductByNum",p_num);
	}

	public int insertProduct(ProductBean pb) {
		return sqlSessionTemplate.insert(nameSpace+"insertProduct",pb);
	}

	public int updateProduct(ProductBean pb) {
		return sqlSessionTemplate.update(nameSpace+"updateProduct", pb);
	}


	public void replyProc(QBoardBean bb) {

		sqlSessionTemplate.update(nameSpace+"plusStep",bb);
		
		bb.setQ_re_step(bb.getQ_re_step()+1);
		bb.setQ_re_level(bb.getQ_re_level()+1);

		sqlSessionTemplate.insert(nameSpace+"insertReply",bb);
		
	}


	


}