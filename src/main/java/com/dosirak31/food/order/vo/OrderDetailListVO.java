package com.dosirak31.food.order.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailListVO {
	private List<OrderDetailVO> orderlist;
}
