<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.SubLocationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	List<LocationVO> lo_list = (List<LocationVO>)session.getAttribute("location"); 
	List<SubLocationVO> sub_list = (List<SubLocationVO>)session.getAttribute("SubLocation");
	pageContext.setAttribute("sub_list", sub_list);
	pageContext.setAttribute("lo_list", lo_list);
	System.out.println("check : "+lo_list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<title>SideBar</title>
</head>
<body>
	<div class="row bg-light">
        <!-- subnav -->
    </div>

    <div class="row">
        <div>
            <!-- aside -->
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                                ${lo_list[0].getL_Name() }
                            </button>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseTwo"
                                aria-expanded="true" aria-controls="collapseTwo">
                                경기
                            </button>
                        </h5>
                    </div>

                    <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseThree"
                                aria-expanded="true" aria-controls="collapseThree">
                                경남
                            </button>
                        </h5>
                    </div>

                    <div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFour"
                                aria-expanded="true" aria-controls="collapseFour">
                                경북
                            </button>
                        </h5>
                    </div>

                    <div id="collapseFour" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFive"
                                aria-expanded="true" aria-controls="collapseFive">
                                충남
                            </button>
                        </h5>
                    </div>

                    <div id="collapseFive" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseSix"
                                aria-expanded="true" aria-controls="collapseSix">
                                충북
                            </button>
                        </h5>
                    </div>

                    <div id="collapseSix" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseSeven"
                                aria-expanded="true" aria-controls="collapseSeven">
                                전남
                            </button>
                        </h5>
                    </div>

                    <div id="collapseSeven" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseEight"
                                aria-expanded="true" aria-controls="collapseEight">
                                전북
                            </button>
                        </h5>
                    </div>

                    <div id="collapseEight" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseNine"
                                aria-expanded="true" aria-controls="collapseNine">
                                강원
                            </button>
                        </h5>
                    </div>

                    <div id="collapseNine" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseTen"
                                aria-expanded="true" aria-controls="collapseTen">
                                제주
                            </button>
                        </h5>
                    </div>

                    <div id="collapseTen" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <ul class="list-group">
                            <li class="list-group-item active">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>







    </div>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>