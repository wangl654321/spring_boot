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
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '输入的不是一个有效的电子邮件地址'
                        },
                        stringLength: {
                            min: 6,
                            max: 16,
                            message: '密码必须超过6,小于16个字符长'
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: /^1(3|4|5|7|8)\d{9}$/,
                            message: '手机号码输入不规范'
                        }
                    }
                },

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
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '用户名只能由字母、数字、点和下划线'
                        }
                    }
                },

                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {
                            field: 'confirmPassword',
                            message: '密码和确认是不一样的'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'password',
                            message: '密码和确认是不一样的'
                        }
                    }
                },
                languages: {
                    validators: {
                        notEmpty: {
                            message: '协议未选中'
                        }
                    }
                },
            }
        });
    });

    function resetFun() {
        $('#searchForm').data('bootstrapValidator').resetForm(true);
    }

    function chankEmailPhone(value) {
        var values = $(value).val();
        var isId = value.id;
        isId = isId+"Id";

        $.post("${ctx}/login/user/validation", {"value": values},
            function (data) {
                if(1 == data){
                    $("#"+isId).attr("data-bv-validator","notEmpty");
                    $("#"+isId).html($(value).attr("placeholder")+"已存在,请重新输入!");
                    $("#submitBtn").attr("disabled","disabled");

                }else{
                    $("#"+isId).removeAttrs("data-bv-validator");
                    $("#"+isId).html("");
                    $("#submitBtn").removeAttrs("disabled");
                }
            });
    }
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
                    <form id="searchForm" action="${ctx}/login/user/save" method="post">
                    <div class="position-relative">
                        <div id="signup-box" class="signup-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header green lighter bigger">
                                        <i class="icon-group blue"></i>
                                        新用户注册
                                    </h4>

                                    <div class="space-6"></div>
                                    <p> 输入您的信息开始: </p>

                                        <fieldset>
                                            <label class="block clearfix">
                                                <div class="form-group">
                                                    <span class="block input-icon input-icon-right">
                                                        <input name="email" id="email" htmlEscape="false" maxlength="20" onchange="chankEmailPhone(this)" class="form-control" placeholder="邮箱"/>
                                                        <small class="help-block" id="emailId"  style="display: block;color: red"></small>
                                                        <i class="icon-envelope"></i>
                                                     </span>
                                                </div>
                                            </label>

                                            <label class="block clearfix">
                                                <div class="form-group">
                                                    <span class="block input-icon input-icon-right">
                                                         <input name="phone" id="phone" htmlEscape="false" maxlength="11" onchange="chankEmailPhone(this)" class="form-control" placeholder="手机号"/>
                                                         <small class="help-block" id="phoneId" style="display: block;color: red"></small>
                                                         <i class="icon-phone"></i>
                                                    </span>
                                                </div>
                                            </label>

                                            <label class="block clearfix">
                                                <div class="form-group">
                                                    <span class="block input-icon input-icon-right">
                                                        <input name="name" id="name" htmlEscape="false" maxlength="16" class="form-control" placeholder="用户名"/>
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

                                            <label class="block clearfix">
                                                <div class="form-group">
                                                    <span class="block input-icon input-icon-right">
                                                        <input name="confirmPassword" type="password" class="form-control" maxlength="16" placeholder="确认密码"/>
                                                        <i class="icon-retweet"></i>
                                                    </span>
                                                </div>
                                            </label>

                                            <label class="block">
                                                <div class="form-group">
                                                    <span class="block input-icon input-icon-right">
                                                        <input type="checkbox" name="languages"/>
                                                        <span class="lbl">
                                                            我接受
                                                            <a href="#">用户协议</a>
                                                        </span>
                                                    </span>
                                                </div>


                                            </label>

                                            <div class="space-24"></div>

                                            <div class="clearfix">
                                                <button type="button" onclick="resetFun()" class="width-30 pull-left btn btn-sm">
                                                    <i class="icon-refresh"></i>
                                                    重置
                                                </button>

                                                <button type="submit" id="submitBtn" class="width-65 pull-right btn btn-sm btn-success">
                                                    注册
                                                    <i class="icon-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </fieldset>
                                </div>

                                <div class="toolbar center">
                                    <a href="${ctx}/" class="back-to-login-link">
                                        <i class="icon-arrow-left"></i>
                                        Back to login
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="display:none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='utf-8'></script>
</div>
</body>
</html>
