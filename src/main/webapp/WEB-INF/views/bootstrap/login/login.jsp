<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/base/base.jsp" %>
<%@include file="/WEB-INF/views/base/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Ace控制台</title>
    <link rel="stylesheet" href="${ctxStatic}/js/common/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctxStatic}/js/common/dist/css/bootstrapValidator.css"/>

    <script type="text/javascript" src="${ctxStatic}/js/common/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/common/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/common/dist/js/bootstrapValidator.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function() {
        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '用户名是无效的',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 4,
                            max: 16,
                            message: '用户名必须超过4,小于16个字符长'
                        }
                    }
                },

                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 16,
                            message: '密码必须超过6,小于16个字符长'
                        }
                    }
                }

            }
        });
    });

</script>

<body class="login-layout">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <i class="icon-leaf green"></i>
                            <span class="red">Ace</span>
                            <span class="white">管理系统</span>
                        </h1>
                        <h4 class="blue">&copy; 汇元科技</h4>
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="icon-coffee green"></i>
                                        请输入您的信息
                                    </h4>
                                    <c:if test="${not empty login}">
                                        <span style="color: red">${login}</span>
                                    </c:if>
                                    <div class="space-6"></div>

                                    <form id="searchForm" action="${ctx}/login/user/login" method="post">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <div class="form-group">
                                                    <span class="block input-icon input-icon-right">
                                                        <input name="name" id="name" htmlEscape="false" maxlength="20" class="form-control" placeholder="邮箱/手机号码"/>
                                                        <small class="help-block" id="nameId"  style="display: block;color: red"></small>
                                                         <i class="icon-user"></i>
                                                     </span>
                                                </div>

                                            </label>

                                            <label class="block clearfix">
                                                <div class="form-group">
                                                    <span class="block input-icon input-icon-right">
                                                         <input name="password" type="password" id="password" htmlEscape="false" maxlength="16" class="form-control" placeholder="密码"/>
                                                         <i class="icon-lock"></i>
                                                    </span>
                                                </div>
                                            </label>

                                            <div class="space"></div>

                                            <div class="clearfix">
                                               <%-- <label class="inline">
                                                    <input type="checkbox" name="languages"/>
                                                    <span class="lbl"> 记住我</span>
                                                </label>--%>

                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="icon-key"></i>
                                                    登录
                                                </button>
                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                    <div class="social-or-login center">
                                        <span class="bigger-110">或登录使用</span>
                                    </div>

                                    <div class="social-login center">
                                        <a class="btn btn-primary">
                                            <i class="icon-facebook"></i>
                                        </a>

                                        <a class="btn btn-info">
                                            <i class="icon-twitter"></i>
                                        </a>

                                        <a class="btn btn-danger">
                                            <i class="icon-google-plus"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="${ctx}/login/user/forgot"  class="forgot-password-link">
                                            <i class="icon-arrow-left"></i>
                                            I forgot my password
                                        </a>
                                    </div>

                                    <div>
                                        <a href="${ctx}/login/user/register" class="user-signup-link">
                                            I want to register
                                            <i class="icon-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="display:none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>
