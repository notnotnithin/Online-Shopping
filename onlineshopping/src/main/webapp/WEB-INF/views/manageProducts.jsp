<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	
	<div class="row">
		<c:if test="${not empty message}">
			<div class="col-xs-12">
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
		</c:if>

		<div
			class="col-xs-12 col-sm-12 col-md-offset-1 col-md-9 col-lg-offset-2 col-lg-8">
			<div class="module panel panel-primary">
				<div class="panel-heading">
					<h4>Product Management</h4>
				</div>
				<div class="panel-body">
					<!-- FORM ELEMENTS -->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST" enctype="multipart/form-data">
						<!-- PRODUCT NAME -->
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Product Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>
						<!-- BRAND NAME -->
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								Brand Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>
						<!-- PRODUCT DESCRIPTION -->
						<div class="form-group">
							<label class="control-label col-md-4" for="description">Product
								Description:</label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" rows="4"
									placeholder="Write a description" class="form-control" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>
						<!-- UNIT PRICE -->
						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Enter
								Unit Price: </label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder="Unit Price in &#8377;" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>
						<!-- QUANTITY -->
						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Quantity
								Available: </label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity"
									placeholder="Quantity Available" class="form-control" />
							</div>
						</div>
						<!-- FILE ELEMENT FOR AN IMAGE UPLOAD -->
						<div class="form-group">
							<label class="control-label col-md-4" for="file">Select an image: </label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>
						<!-- CATEGORY -->
						<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">Select
								a Category: </label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId"
									path="categoryId" items="${categories}" itemLabel="name"
									itemValue="id" />
									
								<c:if test="${product.id == 0}">
									<div class="text-right">
										<br />
										<button type="button" data-toggle="modal" data-target="#myCategoryModal" class="btn btn-warning btn-xs">Add a Category</button>
									</div>
								</c:if>
							</div>
						</div>
						<!-- SUBMIT BUTTON -->
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-primary" />

								<!-- Hidden fields for products -->
								<sf:hidden path="id" />
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />

							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xs-12">
			<h3>Available Products</h3>
			<hr/>
		</div>
		
		<div class="col-xs-12">
			<div style="overflow:auto">
				<!-- Products table for admin -->
				<table id="adminProductsTable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myCategoryModal" role="Dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content"> 
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Add a new Category</h4>
				</div>
				<div class="modal-body">
					<!-- Category form -->
					<sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category" method="POST"
						class="form-horizontal">
						<div class="form-group">
							<label for="category_name" class="control-label col-md-4">Category Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="category_name" class="form-control" />
							</div>
						</div>
						
						<div class="form-group">
							<label for="description" class="control-label col-md-4">Category Description</label>
							<div class="col-md-8">
								<sf:textarea cols="" rows="5" path="description" id="category_description" class="form-control" />
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" value="Add Category" class="btn btn-primary" />
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
	
</div>