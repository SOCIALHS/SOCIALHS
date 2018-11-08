<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row d-block m-0">
	<div class="row">
		<c:forEach var="listAll" items="${listAll }" varStatus="idx">
			<div class="accordion" id="accordionExample">
				<div class="card" style="text-align: center">
					<div class="card-header" id="heading${num[idx.index] }">
						<h5 class="mb-0">
							<button class="btn btn-light" type="button"
								name="${num[idx.index] }" data-toggle="collapse"
								data-target=${num[idx.index] } aria-expanded="false"
								aria-controls="collapseOne" onclick="check(this)"
								id="My${num[idx.index] }">${listAll.getL_Name() }</button>
						</h5>
					</div>

					<div id=${num[idx.index] } class="collapse"
						aria-labelledby="heading" data-parent="#accordionExample">
						<div class="card-body">
							<c:forEach var="listSubAll" items="${listSubAll }">
								<c:if test="${listSubAll.getL_idx() == listAll.getL_Idx() }">
									<button type="button"
										class="list-group-item list-group-item-action"
										style="border: none">${listSubAll.getSl_name() }</button>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</c:forEach>
	</div>
</div>
