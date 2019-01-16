package com.company.smartwater.utils;

import com.company.smartwater.dto.SmartPageInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public class PageUtils {

    public static SmartPageInfo calculatePage(SmartPageInfo cubePage, final long totalcount, final long count,
                                              final int pageSize, final int pageNumber, final List<?> list) {
        long totalPages = (totalcount + pageSize - 1) / pageSize;
        cubePage.setTotalPages((int) totalPages);
        cubePage.setTotalElements(totalcount);
        cubePage.setSize(pageSize);
        cubePage.setNumberOfElements((int) count);
        if (pageNumber == 0) {
            cubePage.setFirst(true);
        } else {
            cubePage.setFirst(false);
        }
        if (pageNumber == totalPages - 1) {
            cubePage.setLast(true);
        } else {
            cubePage.setLast(false);
        }
        cubePage.setContent(list);
        return cubePage;
    }

    public static SmartPageInfo toPage(final boolean isFirst, final boolean isLast, final int number,
                                       final int numberOfElements, final int size, final long totalElements, final int totalPages,
                                       final List<?> list) {
        SmartPageInfo cubePage = new SmartPageInfo();
        cubePage.setFirst(isFirst);
        cubePage.setLast(isLast);
        cubePage.setNumber(number);
        cubePage.setNumberOfElements(numberOfElements);
        cubePage.setSize(size);
        cubePage.setTotalElements(totalElements);
        cubePage.setTotalPages(totalPages);
        cubePage.setContent(list);
        return cubePage;
    }

    public static SmartPageInfo toPage(PageInfo<?> pageInfo) {
        SmartPageInfo cubePage = new SmartPageInfo();
        cubePage.setFirst(pageInfo.isIsFirstPage());
        cubePage.setLast(pageInfo.isIsLastPage());
        cubePage.setNumber(pageInfo.getPageNum());
        cubePage.setNumberOfElements(pageInfo.getSize());
        cubePage.setSize(pageInfo.getPageSize());
        cubePage.setTotalElements(pageInfo.getTotal());
        cubePage.setTotalPages(pageInfo.getPages());
        cubePage.setContent(pageInfo.getList());
        return cubePage;
    }

}
