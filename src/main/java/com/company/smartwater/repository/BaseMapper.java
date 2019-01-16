package com.company.smartwater.repository;

import com.company.smartwater.domain.BaseEntity;

public interface BaseMapper<T extends BaseEntity>{
	int deleteByPrimaryKey(Long id);

	int insert(T record);

	int insertSelective(T record);

	T selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(T record);

	int updateByPrimaryKey(T record);

	default T saveInsert(T t) {
		t.preCreate();
		this.insert(t);
		return t;
	}

	default T saveUpdate(T t){
		t.preUpdate();
		this.updateByPrimaryKey(t);
		return t;
	}
}
