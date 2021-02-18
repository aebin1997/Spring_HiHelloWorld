<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="kimwoolina">
<style type="text/css">
@charset "UTF-8";

.old-style div[data-role=page] {
	display: none
}

.old-style div[data-role=page].km-page-active {
	display: block
}

.old-style div[data-role=modal] {
	display: none
}

.old-style .km-email-recommend {
	display: none;
	overflow-y: auto;
	z-index: 100;
	width: 438px;
	padding: 10px 0;
	margin: 0 30px;
	border: 1px solid #b6b6b6;
	max-height: 180px;
	border-radius: 0 0 6px 6px
}

.old-style .km-email-recommend li {
	display: block;
	height: 34px;
	padding-left: 20px;
	font-size: 18px;
	line-height: 34px;
	text-align: left
}

.old-style .km-email-recommend li:hover {
	background: #f0f0f0;
	text-decoration: none
}

.old-style #pageRegisterBackup .km-input-wrapper.clearable {
	border-radius: 6px 6px 0 0
}

.old-style .km-dimmed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10000;
	background-color: rgba(0, 0, 0, 0.5)
}

.old-style .km-dimmed.darker {
	background-color: rgba(0, 0, 0, 0.7)
}

.old-style .txt_cancel {
	text-decoration: line-through
}

.old-style body, .old-style div, .old-style dl, .old-style dt,
	.old-style dd, .old-style ul, .old-style ol, .old-style li, .old-style h1,
	.old-style h2, .old-style h3, .old-style h4, .old-style h5, .old-style h6,
	.old-style pre, .old-style code, .old-style form, .old-style fieldset,
	.old-style legend, .old-style textarea, .old-style p, .old-style blockquote,
	.old-style th, .old-style td, .old-style input, .old-style select,
	.old-style textarea, .old-style button {
	margin: 0;
	padding: 0
}

.old-style fieldset, .old-style img {
	border: 0 none
}

.old-style dl, .old-style ul, .old-style ol, .old-style menu, .old-style li
	{
	list-style: none
}

.old-style blockquote, .old-style q {
	quotes: none
}

.old-style blockquote:before, .old-style blockquote:after, .old-style q:before,
	.old-style q:after {
	content: '';
	content: none
}

.old-style input, .old-style select, .old-style textarea, .old-style button
	{
	border: 0 none;
	border-radius: 0;
	vertical-align: middle
}

.old-style input::-ms-clear {
	display: none
}

.old-style button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer
}

.old-style body {
	background-color: #fff
}

.old-style body, .old-style th, .old-style td, .old-style input,
	.old-style select, .old-style textarea, .old-style button {
	font-size: 14px;
	line-height: 1.5;
	font-family: '맑은 고딕', 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif,
		'돋움', dotum;
	color: #1e1e1e
}

.old-style a {
	color: #1e1e1e;
	text-decoration: none
}

.old-style a:active, .old-style a:hover {
	text-decoration: underline
}

.old-style a:active {
	background-color: transparent
}

.old-style address, .old-style caption, .old-style cite, .old-style code,
	.old-style dfn, .old-style em, .old-style var {
	font-style: normal;
	font-weight: normal
}

.old-style html, .old-style body {
	height: 100%
}

.old-style #kakaoIndex {
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 0;
	height: 1px;
	margin: 0;
	padding: 0
}

.old-style .ir_pm {
	display: block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px
}

.old-style .ir_wa {
	display: block;
	overflow: hidden;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: -1
}

.old-style .screen_out {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px
}

.old-style .show {
	display: block
}

.old-style .hide {
	display: none
}

.old-style .ico_account {
	display: block;
	overflow: hidden;
	font-size: 0;
	background-image:
		url("/assets/techin/legacy/ico_kaccount-66d2cfe9a2dbaad445a38ad0d2cca76805b8f2f54e7beaacb5e08210d732c507.png");
	background-repeat: no-repeat;
	background-position: 0 0;
	line-height: 0;
	text-indent: -9999px
}

.old-style .ico_myinfo {
	display: block;
	overflow: hidden;
	font-size: 0;
	background-image:
		url("/assets/techin/legacy/ico_myinfo-8775bb2f0f1e511e5e149235b2e2d6719d3b314e3a5f4679b9abf33a07803846.png");
	background-repeat: no-repeat;
	background-position: 0 0;
	line-height: 0;
	text-indent: -9999px
}

.old-style .tit_kaccount {
	font-weight: normal;
	font-size: 20px;
	letter-spacing: -1px
}

.old-style html:lang(ko) .tit_kaccount, .old-style html:lang(en) .tit_kaccount
	{
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum
}

.old-style .wrap_btn {
	display: inline-block;
	overflow: hidden;
	margin-top: 30px;
	margin-left: 10px;
	vertical-align: top
}

.old-style .wrap_btn .btn_account {
	float: left;
	width: 180px;
	height: 45px;
	margin-right: 10px;
	border-radius: 4px;
	outline: 0 none
}

.old-style .btn_account:hover {
	text-decoration: none
}

.old-style .btn_cancel {
	font-weight: bold;
	background-color: #e6e6e6;
	outline: 0 none
}

.old-style .btn_cancel:hover {
	background-color: #505050
}

.old-style .btn_apply, .old-style .btn_send {
	position: relative;
	font-weight: bold;
	background-color: #ffdc00;
	outline: 0 none
}

.old-style .btn_apply:hover, .old-style .btn_send:hover {
	background-color: #ffcd00
}

.old-style .btn_disabled, .old-style .btn_disabled:hover {
	font-weight: bold;
	color: #777;
	background-color: #e6e6e6
}

.old-style .link_account {
	font-size: 14px;
	color: #5065aa;
	text-decoration: underline
}

.old-style .link_account .ico_account {
	display: inline-block;
	width: 6px;
	height: 9px;
	margin: 6px 0 0 6px
}

.old-style .emph_point {
	font-weight: bold;
	color: #4bb3ad
}

.old-style .txt_point {
	color: #4bb3ad
}

.old-style #kakaoWrap {
	position: relative;
	min-height: 100%;
	min-width: 1024px;
	background-color: #fff
}

.old-style #kakaoHead {
	overflow: hidden;
	position: relative;
	min-width: 1024px;
	height: 60px;
	background-color: #ffdc00;
	text-align: center
}

.old-style #kakaoFoot {
	height: 60px;
	padding: 19px 0 60px;
	min-width: 1024px;
	border-top: 1px solid #d4d4d4;
	font-size: 12px;
	text-align: center;
	position: absolute;
	width: 100%;
	bottom: 0
}

.old-style #kakaoContent {
	display: block;
	height: 100%;
	min-width: 1024px;
	min-height: 590px;
	padding-bottom: 140px
}

.old-style #cMain {
	overflow: auto;
	height: 100%
}

.old-style #mArticle {
	overflow: hidden;
	width: 940px;
	margin: 54px auto 0;
	padding: 0 30px
}

.old-style #kakaoHead h1 {
	position: absolute;
	top: 20px;
	left: 30px;
	z-index: 10;
	font-family: Malgun Gothic, 맑은 고딕, dotum, 돋움, Hiragino Kaku Gothic ProN,
		Meiryo, sans-serif
}

.old-style #kakaoHead .link_kacount {
	display: block;
	width: auto;
	height: 20px;
	font-size: 18px;
	font-weight: normal
}

.old-style html:lang(ko) #kakaoHead .link_kacount, .old-style html:lang(en) #kakaoHead .link_kacount
	{
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum
}

.old-style #kakaoHead .link_kacount:hover, .old-style #kakaoHead .link_kacount:focus,
	.old-style #kakaoHead .link_kacount:active {
	text-decoration: none
}

.old-style #kakaoHead .link_kacount .logo_kaccount {
	vertical-align: top
}

.old-style #kakaoHead .info_login {
	overflow: hidden;
	position: absolute;
	top: 20px;
	right: 30px;
	font-size: 12px;
	z-index: 10
}

.old-style .info_login .txt_nick {
	float: left
}

.old-style .info_login .txt_call {
	float: left;
	padding-left: 5px
}

.old-style .info_login .txt_kaccount {
	float: left
}

.old-style .info_login .txt_kaccount:after {
	content: '';
	float: left;
	width: 1px;
	height: 14px;
	margin: 3px 10px 0;
	background-color: #505050
}

.old-style .info_login .txt_kaccount .txt_id {
	float: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: right
}

.old-style .info_login .txt_kaccount .txt_email {
	float: left
}

.old-style .info_login .txt_bar {
	float: left;
	width: 1px;
	height: 14px;
	margin: 3px 10px 0;
	background-color: #505050
}

.old-style .info_login .link_login {
	float: left;
	font-weight: bold
}

.old-style #kakaoHead .link_logo {
	float: left;
	height: 22px;
	margin-top: 2px;
	font-size: 18px;
	font-weight: normal
}

.old-style #kakaoHead .link_logo:hover {
	text-decoration: none
}

.old-style #kakaoHead .logo_kakao {
	float: left;
	margin-right: 10px
}

.old-style #kakaoHead .service_kakao {
	float: left;
	font-weight: normal;
	font-size: 18px;
	line-height: 20px
}

.old-style #kakaoGnb {
	display: inline-block;
	width: 600px;
	height: 60px;
	margin-right: 50px
}

.old-style #kakaoGnb .list_gnb {
	overflow: hidden;
	display: inline-block;
	height: 60px
}

.old-style #kakaoGnb .list_gnb li {
	float: left;
	margin-left: 23px
}

.old-style #kakaoGnb .list_gnb li:first-child {
	margin-left: 0
}

.old-style .link_gnb {
	display: block;
	height: 40px;
	padding-top: 20px;
	letter-spacing: -1px;
	color: #505050
}

.old-style html:lang(ko) .link_gnb, .old-style html:lang(en) .link_gnb {
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum
}

.old-style .on .link_gnb, .old-style .link_gnb:hover {
	height: 38px;
	border-bottom: 2px solid #1e1e1e;
	text-decoration: none
}

.old-style .wrap_kaccount {
	margin-top: 15px;
	padding-bottom: 100px;
	border-top: 1px solid #1e1e1e;
	text-align: center
}

.old-style .info_set .list_set {
	overflow: hidden;
	min-height: 50px;
	background-color: #fafafa;
	border-bottom: 1px solid #d4d4d4;
	text-align: left
}

.old-style .list_set .tit_set {
	float: left;
	width: 124px;
	padding: 16px 6px 13px 10px;
	font-weight: bold;
	word-break: break-all
}

.old-style .list_set .txt_set {
	display: block;
	overflow: hidden;
	padding: 13px 15px;
	background-color: #fff
}

.old-style .list_set .txt_set .inner_txt {
	float: left;
	min-height: 20px;
	margin-right: 14px;
	padding-top: 4px;
	line-height: 20px
}

.old-style .list_set .txt_set .inner_txt02 {
	margin-top: 10px
}

.old-style .list_set .txt_set .emph_warn {
	color: #f45b3a
}

.old-style .list_set .txt_set .ico_warn {
	display: inline-block;
	width: 18px;
	height: 18px;
	background-position: -44px -44px;
	vertical-align: top
}

.old-style .list_set .txt_set .desc_txt {
	float: left;
	width: 100%;
	margin: 10px 0 5px;
	font-size: 13px;
	color: #767676;
	line-height: 18px
}

.old-style .list_set .txt_profile {
	font-size: 0
}

.old-style .info_set .btn_set {
	float: left;
	height: 22px;
	margin-right: 9px;
	padding: 0 8px;
	border: 1px solid #b6b6b6;
	text-align: center;
	line-height: 23px;
	border-radius: 2px;
	font-size: 12px;
	background-color: #fafafa
}

.old-style .info_set .btn_set:hover {
	background-color: #f4f4f4;
	text-decoration: none
}

.old-style .wrap_link {
	display: block;
	margin-top: 9px;
	text-align: right
}

.old-style .tit_account {
	display: block;
	margin: 34px 0 21px;
	font-weight: normal;
	font-size: 26px
}

.old-style html:lang(ko) .tit_account, .old-style html:lang(en) .tit_account
	{
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum
}

.old-style .desc_account {
	padding-bottom: 20px;
	line-height: 22px;
	color: #606060
}

.old-style .desc_account02 {
	margin-top: 4px
}

.old-style .info_set .link_set {
	color: #3c64e6;
	text-decoration: underline
}

.old-style .wrap_kaccount .info_app {
	overflow: hidden;
	padding: 40px 0;
	border-bottom: 1px solid #d4d4d4
}

.old-style .wrap_kaccount .info_app .ico_app {
	border-radius: 5px;
	vertical-align: top
}

.old-style .wrap_kaccount .info_app .tit_app {
	display: block;
	margin-top: 12px;
	font-size: 24px;
	font-weight: normal
}

.old-style html:lang(ko) .wrap_kaccount .info_app .tit_app, .old-style html:lang(en) .wrap_kaccount .info_app .tit_app
	{
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum
}

.old-style .wrap_kaccount .info_app .txt_app {
	color: #767676
}

.old-style .wrap_kaccount .info_app .desc_app {
	margin-top: 20px;
	color: #767676
}

.old-style .wrap_kaccount .wrap_email {
	width: 940px;
	margin-top: 10px;
	text-align: center
}

.old-style .fld_email .wrap_link {
	text-align: center
}

.old-style .fld_email .wrap_link .link_account {
	display: inline-block;
	margin-top: 21px;
	font-weight: normal;
	color: #606060
}

.old-style .wrap_email span.tf_txt {
	width: 272px;
	max-width: 906px;
	padding: 0 15px;
	background-color: #f0f0f0;
	vertical-align: top;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: left
}

.old-style .wrap_email .box_email {
	position: relative;
	width: 272px;
	margin: 0 auto;
	text-align: left
}

.old-style .box_email .lab_txt {
	position: absolute;
	top: 9px;
	left: 15px;
	color: #777
}

.old-style .wrap_email .tf_txt {
	display: inline-block;
	width: 272px;
	height: 38px;
	padding: 0 39px 0 15px;
	font-weight: bold;
	border: 1px solid #d4d4d4;
	border-radius: 3px;
	line-height: 38px;
	box-sizing: border-box
}

.old-style .wrap_email .tf_txt::placeholder {
	color: #777
}

.old-style .wrap_email .tf_txt:-ms-input-placeholder {
	color: #777
}

.old-style .wrap_email .tf_txt::-ms-input-placeholder {
	color: #777
}

.old-style .box_email .select_email {
	display: none;
	position: absolute;
	top: 39px;
	left: 0;
	width: 100%;
	background-color: #fff;
	border: 1px solid #d4d4d4;
	font-weight: bold;
	padding: 14px 15px 11px;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	z-index: 10;
	box-sizing: border-box
}

.old-style .box_email .select_email li {
	height: 26px
}

.old-style .box_email .btn_del {
	overflow: hidden;
	position: absolute;
	right: 6px;
	top: 6px;
	display: none;
	width: 27px;
	height: 27px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px
}

.old-style .box_email .btn_del .ico_account {
	width: 23px;
	height: 23px;
	margin: 0 auto;
	background-position: 0 -16px
}

.old-style .box_email .btn_del:hover .ico_account {
	background-position: -28px -16px
}

.old-style .info_write .lab_txt {
	display: none
}

.old-style .info_write .select_email, .old-style .info_write .btn_del {
	display: block
}

.old-style .info_write .select_email .link_email {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap
}

.old-style .info_write .select_email .link_email:hover {
	background-color: #f0f0f0;
	text-decoration: none
}

.old-style .tbl_account {
	margin-top: 39px;
	border-collapse: collapse;
	border-spacing: 0
}

.old-style .tbl_account th {
	height: 50px;
	background-color: #fafafa;
	border-top: 1px solid #1e1e1e;
	border-bottom: 1px solid #d5d5d5
}

.old-style .tbl_account td {
	height: 50px;
	border-bottom: 1px solid #d4d4d4
}

.old-style .desc_note {
	margin-top: 40px;
	line-height: 22px;
	text-align: left;
	font-size: 12px;
	background-color: #eee;
	padding: 10px 15px
}

.old-style .connect_cont {
	position: relative
}

.old-style .tit_connect {
	display: block;
	margin: 30px 0 8px;
	text-align: left
}

.old-style .list_app {
	overflow: hidden;
	padding: 15px 0;
	background-color: #f8f8f8
}

.old-style .list_app li {
	float: left;
	width: 195px;
	height: 32px;
	padding: 5px 20px
}

.old-style .list_app .ico_app {
	float: left;
	margin-right: 10px
}

.old-style .list_app .tit_app {
	overflow: hidden;
	display: block;
	margin-top: 7px;
	text-align: left;
	font-weight: normal;
	text-overflow: ellipsis;
	white-space: nowrap
}

.old-style .connect_cont .desc_app {
	padding: 25px 0;
	background-color: #f8f8f8
}

.old-style .connect_cont .link_account {
	position: absolute;
	top: 4px;
	right: 0;
	text-decoration: none
}

.old-style .tbl_account .txt_caption {
	height: 30px;
	text-align: left;
	font-weight: bold
}

.old-style .tbl_account .btn_move .ico_account {
	width: 21px;
	height: 21px;
	margin: 0 auto;
	background-position: 0 -40px
}

.old-style .tbl_account .btn_move:hover .ico_account {
	background-position: -28px -40px
}

.old-style .wrap_account .list_menu {
	overflow: hidden;
	margin: 35px 0 23px;
	width: 940px;
	height: 52px
}

.old-style .wrap_account .list_menu li {
	float: left;
	width: 470px
}

.old-style .wrap_account .list_menu .link_menu {
	display: block;
	width: 469px;
	height: 35px;
	padding-top: 15px;
	font-size: 15px;
	background-color: #f2f2f2;
	border: 1px solid #d4d4d4;
	border-left: 0;
	letter-spacing: -1px
}

.old-style .wrap_account .list_menu li:first-child .link_menu {
	width: 468px;
	border-left: 1px solid #d4d4d4
}

.old-style .wrap_account .list_menu .on .link_menu, .old-style .wrap_account .list_menu .link_menu:hover
	{
	text-decoration: none;
	background-color: #5066aa;
	border: 1px solid #5066aa;
	border-left: 0 none;
	color: #fff
}

.old-style .wrap_account .list_menu .on:first-child .link_menu,
	.old-style .wrap_account .list_menu li:first-child .link_menu:hover {
	border-left: 1px solid #5066aa
}

.old-style .wrap_account .desc_txt {
	text-align: left
}

.old-style .wrap_account .link_info {
	display: inline-block;
	margin-top: 6px;
	text-decoration: underline;
	color: #5065aa
}

.old-style .wrap_account .caption_txt {
	margin-bottom: 10px;
	font-weight: bold;
	text-align: left
}

.old-style .wrap_account .btn_logout {
	display: inline-block;
	height: 24px;
	padding: 0 8px;
	border: 1px solid #b6b6b6;
	text-align: center;
	line-height: 25px;
	border-radius: 2px;
	font-size: 12px;
	background-color: #fafafa
}

.old-style .wrap_account .btn_logout:hover {
	background-color: #f4f4f4;
	text-decoration: none
}

.old-style .box_more {
	overflow: hidden;
	margin-top: 20px
}

.old-style .box_more .btn_open {
	float: left;
	position: relative;
	width: 890px;
	height: 50px;
	border: 1px solid #e6e6e6;
	border-right: 0 none;
	font-size: 18px;
	letter-spacing: -1px;
	outline: 0;
	-webkit-text-fill-color: #1e1e1e;
	-webkit-opacity: 1
}

.old-style .box_more .btn_open:hover {
	background-color: #f8f8f8
}

.old-style .box_more .btn_disabled, .old-style .box_more .btn_disabled:hover
	{
	background-color: #fff
}

.old-style .box_more .btn_open .emph_paging {
	color: #4bb3ad
}

.old-style .box_more .btn_open .ico_account {
	display: inline-block;
	width: 13px;
	height: 10px;
	background-position: -52px 0
}

.old-style .box_more .btn_close {
	float: left;
	width: 50px;
	height: 50px;
	background-color: #1e1e1e;
	outline: 0
}

.old-style .box_more .btn_close .ico_account {
	width: 13px;
	height: 10px;
	margin: 0 auto;
	background-position: -52px -11px
}

.old-style .footer_link {
	height: 18px
}

.old-style .footer_link .link_info {
	display: inline-block;
	color: #898989
}

.old-style .footer_link .txt_bar {
	display: inline-block;
	width: 1px;
	height: 8px;
	margin: 4px 16px 0 11px;
	background-color: #ccc
}

.old-style .footer_link .btn_info {
	display: inline-block;
	padding: 0;
	margin-top: -2px;
	font-size: 12px;
	line-height: 22px;
	color: #898989;
	vertical-align: top
}

.old-style .footer_info {
	margin-top: 12px;
	color: #b4b4b4
}

.old-style .footer_info .link_kakao {
	color: #b4b4b4
}

.old-style .txt_info .txt_bar {
	display: inline-block;
	width: 1px;
	height: 8px;
	margin: 4px 9px 0;
	background-color: #ccc
}

.old-style .footer_info .txt_copyright {
	font-size: 12px;
	letter-spacing: 0
}

.old-style .ico_login {
	display: block;
	overflow: hidden;
	background-image:
		url("/assets/techin/ico_login_320-39c41bb61c07306fa00a970792b90f0b80ca638be7e82c5853c9130715899602.png");
	background-repeat: no-repeat
}

.old-style .util_cont {
	position: relative;
	display: inline-block
}

.old-style .util_cont .ico_arr {
	display: inline-block;
	width: 6px;
	height: 4px;
	margin: 8px 0 0 5px;
	background-position: -70px -44px;
	vertical-align: top
}

.old-style .util_cont .cont_util {
	display: none;
	position: absolute;
	bottom: -9px;
	left: -12px;
	width: 78px;
	background-color: #fff;
	border: 1px solid #ddd
}

.old-style .util_lang .cont_util {
	display: block
}

.old-style .cont_util .item_lang {
	display: block;
	height: 32px
}

.old-style .cont_util .item_lang .link_lang {
	display: block;
	padding: 0 10px;
	line-height: 32px;
	text-align: left
}

.old-style .cont_util .on .link_lang, .old-style .cont_util .item_lang .link_lang:hover
	{
	background-color: #eee;
	text-decoration: none
}

.old-style .dimmed_layer {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 50;
	width: 100%;
	height: 100%;
	background-color: #000;
	opacity: .4;
	filter: alpha(opacity = 40)
}

.old-style .layer_account {
	display: none;
	position: absolute;
	left: 50%;
	z-index: 55;
	width: 322px;
	margin-bottom: 147px;
	padding: 43px 40px 50px;
	border: 1px solid #b6b6b6;
	background-color: #fff;
	text-align: center
}

.old-style .layer_open .dimmed_layer, .old-style .layer_open .layer_account
	{
	display: block
}

.old-style .layer_head {
	margin-bottom: 25px
}

.old-style .layer_head .tit_layer {
	font-weight: normal;
	font-size: 24px;
	letter-spacing: -1px;
	line-height: 29px
}

.old-style html:lang(ko) .layer_head .tit_layer, .old-style html:lang(en) .layer_head .tit_layer
	{
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum
}

.old-style .layer_body {
	text-align: left
}

.old-style .layer_body .wrap_email {
	margin-top: 10px
}

.old-style .layer_body .wrap_email .box_email {
	position: relative;
	width: 322px
}

.old-style .layer_body .wrap_email .tf_txt {
	width: 100%
}

.old-style .layer_body .list_email {
	margin-top: 16px
}

.old-style .layer_body .list_email li {
	margin-top: 6px;
	font-size: 12px;
	color: #767676;
	line-height: 18px
}

.old-style .layer_body .ico_app {
	display: block;
	margin: 0 auto;
	border-radius: 5px
}

.old-style .layer_body .tit_app {
	display: block;
	margin-top: 9px;
	font-size: 16px;
	font-weight: normal;
	text-align: center
}

.old-style .layer_body .txt_app, .old-style .layer_body .desc_app {
	display: block;
	font-size: 12px;
	color: #767676;
	text-align: center
}

.old-style .layer_body .desc_app {
	margin-top: 15px;
	text-align: left
}

.old-style .layer_body .desc_txt {
	margin-top: 15px;
	text-align: left;
	font-size: 16px
}

.old-style html:lang(ko) .layer_body .txt_kakaofont, .old-style html:lang(en) .layer_body .txt_kakaofont
	{
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum
}

.old-style .layer_foot {
	padding-top: 37px
}

.old-style .layer_foot .btn_send, .old-style .layer_foot .btn_cancel {
	width: 130px;
	height: 40px
}

.old-style .layer_foot .wrap_btn {
	margin-top: 0
}

.old-style .layer_foot .btn_close {
	position: absolute;
	top: 5px;
	right: 5px;
	width: 33px;
	height: 33px
}

.old-style .layer_foot .btn_close .ico_account {
	width: 13px;
	height: 13px;
	margin: 10px auto;
	background-position: -36px 0
}

.old-style .wrap_protect {
	overflow: hidden;
	width: 100%;
	margin-top: 26px
}

.old-style .wrap_protect .btn_protect {
	position: relative;
	float: left;
	width: 320px;
	height: 46px;
	margin-left: 20px;
	padding: 26px 44px 26px 94px;
	border: 1px solid #d4d4d4;
	background-color: #fff;
	text-align: left
}

.old-style .wrap_protect .btn_protect:hover {
	background-color: #fafafa;
	text-decoration: none
}

.old-style .wrap_protect .btn_info {
	margin-left: 0
}

.old-style .wrap_protect .tit_protect {
	display: block;
	overflow: hidden;
	font-size: 14px;
	line-height: 22px;
	text-overflow: ellipsis;
	white-space: nowrap
}

.old-style .wrap_protect .txt_protect {
	display: block;
	overflow: hidden;
	color: #767676;
	font-size: 13px;
	line-height: 20px;
	text-overflow: ellipsis;
	white-space: nowrap
}

.old-style .wrap_protect .ico_protect {
	position: absolute;
	top: 19px;
	left: 20px;
	width: 60px;
	height: 60px;
	background:
		url("/assets/techin/img_protect-5ef96f1990ab0828e0f5842806b468e9debe2508ba2639f7478d616b71e758e6.gif")
		no-repeat 0 0
}

.old-style .wrap_protect .btn_pw .ico_protect {
	background-position: 0 -75px
}

.old-style .wrap_protect .ico_next {
	position: absolute;
	top: 38px;
	right: 20px;
	width: 12px;
	height: 22px;
	background-position: -52px -28px
}

.old-style .wrap_privacy {
	text-align: left
}

.old-style .wrap_privacy .list_menu {
	overflow: hidden;
	margin: 35px 0 23px;
	width: 940px;
	height: 52px;
	text-align: center
}

.old-style .wrap_privacy .list_menu li {
	float: left;
	width: 313px
}

.old-style .wrap_privacy .list_menu .fst {
	width: 314px
}

.old-style .wrap_privacy .list_menu .link_menu {
	display: block;
	width: 312px;
	height: 35px;
	padding-top: 15px;
	font-size: 15px;
	background-color: #f2f2f2;
	border: 1px solid #d4d4d4;
	border-left: 0;
	letter-spacing: -1px
}

.old-style .wrap_privacy .list_menu .fst .link_menu {
	border-left: 1px solid #d4d4d4
}

.old-style .wrap_privacy .list_menu .on .link_menu, .old-style .wrap_privacy .list_menu .link_menu:hover
	{
	text-decoration: none;
	background-color: #5066aa;
	border: 1px solid #5066aa;
	border-left: 0 none;
	color: #fff
}

.old-style .wrap_privacy .list_menu .fst.on .link_menu, .old-style .wrap_privacy .list_menu .fst .link_menu:hover
	{
	border-left: 1px solid #5066aa
}

.old-style .wrap_privacy .desc_privacy {
	font-size: 14px;
	line-height: 22px;
	color: #767676;
	letter-spacing: -1px
}

.old-style .wrap_privacy .list_privacy {
	margin-bottom: 27px;
	padding: 8px 20px 18px;
	border: 1px solid #eee;
	font-size: 13px;
	line-height: 20px
}

.old-style .wrap_privacy .list_privacy li {
	margin-top: 6px;
	padding-left: 9px;
	text-indent: -9px;
	color: #767676;
	letter-spacing: -1px
}

.old-style .wrap_privacy .tbl_privacy {
	border-collapse: collapse;
	border-spacing: 0
}

.old-style .wrap_privacy .tbl_privacy th {
	height: 50px;
	background-color: #fafafa;
	border-top: 1px solid #d4d4d4;
	border-bottom: 1px solid #d4d4d4;
	text-align: center;
	font-weight: normal
}

.old-style .wrap_privacy .tbl_privacy td {
	height: auto;
	padding: 15px 20px 17px;
	border-bottom: 1px solid #d4d4d4;
	text-align: left;
	font-size: 13px;
	line-height: 20px;
	letter-spacing: -1px
}

.old-style .wrap_privacy .tbl_privacy td .link_info {
	color: #3c64e6;
	text-decoration: underline
}

.old-style .wrap_privacy .tbl_privacy .txt_none {
	text-align: center;
	color: #767676
}

.old-style .tit_guide {
	color: #919191
}

.old-style .info_set button.btn_set {
	height: 24px;
	line-height: 22px;
	margin-top: 2px
}

.old-style .list_set .txt_profile .profile_set {
	display: inline-block;
	width: 48px;
	height: 48px;
	margin-right: 10px;
	vertical-align: middle
}

.old-style .list_set .txt_profile .profile_set .img_profile {
	display: block;
	border-radius: 24px
}

.old-style .list_set .txt_profile .inner_txt {
	display: inline-block;
	float: none;
	padding: 0;
	margin-top: -1px;
	font-size: 14px;
	vertical-align: middle
}

.old-style .list_set .txt_profile .btn_set {
	display: inline-block;
	float: none;
	vertical-align: middle
}

.old-style .list_set .txt_set .btn_add {
	position: relative;
	padding-left: 15px;
	margin-top: 3px;
	color: #5066aa
}

.old-style .list_set .btn_add .ico_myinfo {
	position: absolute;
	top: 5px;
	left: 0;
	width: 10px;
	height: 10px;
	margin-right: 5px;
	background-position: -88px -24px
}

.old-style .list_set .wrap_school {
	position: relative;
	z-index: 10
}

.old-style .list_set .list_school {
	position: absolute;
	top: 31px;
	left: 0;
	display: none;
	width: 52px;
	padding: 2px 14px 13px;
	background-color: #fff;
	border: 1px solid #b4b4b4
}

.old-style .list_set .list_school li {
	margin-top: 4px
}

.old-style .list_set .open_layer .list_school {
	display: block
}

.old-style .list_set .list_school .link_txt {
	font-size: 12px;
	color: #767676
}

.old-style .list_set .list_school .on .link_txt, .old-style .list_set .list_school .link_txt:hover
	{
	color: #1e1e1e;
	text-decoration: underline;
	font-weight: bold
}

.old-style .list_set .txt_set .info_add {
	overflow: hidden;
	margin-top: 6px;
	padding-top: 6px;
	border-top: 1px solid #d4d4d4
}

.old-style .list_set .txt_set .img_logo {
	float: left;
	margin: 5px 10px 3px 0
}

.old-style .list_set .txt_set .info_add .inner_txt {
	padding-top: 0;
	line-height: 36px
}

.old-style .list_set .txt_set .info_add .btn_set {
	margin-top: 7px
}

.old-style .list_set .txt_set .info_add .inner_condition {
	line-height: 1.5
}

.old-style .list_set .txt_set .info_add .inner_txt .txt_condition {
	display: block;
	font-size: 12px;
	color: #767676
}

.old-style .info_profile {
	position: relative;
	padding-bottom: 30px;
	border-bottom: 1px solid #d4d4d4
}

.old-style .info_profile .profile_set {
	position: relative;
	display: block;
	width: 110px;
	margin: 40px auto 0
}

.old-style .info_profile .img_profile {
	display: block;
	border-radius: 55px
}

.old-style .info_profile .profile_info {
	position: relative;
	display: inline-block;
	margin-top: 16px
}

.old-style .info_profile .tit_profile {
	font-size: 18px;
	line-height: 24px;
	font-weight: normal
}

.old-style .info_profile .btn_photo {
	position: absolute;
	right: 0;
	bottom: 0;
	width: 40px;
	height: 40px;
	background-position: 0 0
}

.old-style .info_profile .btn_set {
	position: absolute;
	top: 0;
	right: -55px;
	height: 24px;
	padding: 0 7px;
	border: 1px solid #b6b6b6;
	line-height: 22px;
	border-radius: 2px;
	font-size: 12px;
	background-color: #fafafa
}

.old-style .info_profile .btn_set:hover {
	background-color: #f4f4f4;
	text-decoration: none
}

.old-style .info_profile .profile_tf {
	position: relative;
	display: block;
	border: 1px solid #d4d4d4
}

.old-style .info_profile .profile_tf .tf_myinfo {
	width: 256px;
	height: 26px;
	text-align: center;
	border: 0 none
}

.old-style .info_profile .profile_tf .value_txt {
	position: absolute;
	top: 0;
	width: 100%;
	color: #919191;
	line-height: 26px
}

.old-style .info_profile .info_write .value_txt {
	display: none
}

.old-style .profile_btn {
	display: inline-block;
	margin-top: 15px;
	vertical-align: top;
	clear: both
}

.old-style .info_profile .profile_agree {
	position: absolute;
	bottom: 18px;
	right: 0
}

.old-style .info_profile .profile_agree .btn_agree {
	position: relative;
	padding-right: 21px;
	color: #797979;
	font-size: 12px;
	line-height: 15px
}

.old-style .info_profile .profile_agree .ico_myinfo {
	position: absolute;
	top: 0;
	right: 0;
	width: 15px;
	height: 15px;
	background-position: 0 -44px
}

.old-style .info_profile .profile_agree .list_agree {
	display: none;
	position: absolute;
	top: 24px;
	right: 0;
	padding: 10px 14px 14px;
	background-color: #fff;
	border: 1px solid #b4b4b4;
	min-width: 145px;
	text-align: left
}

.old-style .info_profile .open_layer .ico_myinfo, .old-style .info_profile .profile_agree .ico_myinfo:hover
	{
	background-position: 0 -64px
}

.old-style .info_profile .open_layer .list_agree {
	display: block
}

.old-style .profile_agree .list_agree .link_txt {
	font-size: 12px;
	color: #767676
}

.old-style .profile_agree .list_agree .on .link_txt, .old-style .profile_agree .list_agree .link_txt:hover
	{
	color: #1e1e1e;
	text-decoration: underline;
	font-weight: bold
}

.old-style .txt_set .profile_btn {
	margin-bottom: 10px
}

.old-style .btn_profile {
	height: 24px;
	margin-right: 1px;
	padding: 0 8px;
	color: #000;
	line-height: 23px;
	font-size: 12px;
	vertical-align: top
}

.old-style .btn_profile.btn_confirm {
	background-color: #5066aa;
	color: #fff
}

.old-style .btn_profile.btn_confirm:hover {
	background-color: #465ca0
}

.old-style .btn_profile.btn_recant {
	background-color: #e6e6e6
}

.old-style .btn_profile.btn_recant:hover {
	background-color: #dcdcdc
}

.old-style .info_set .list_myinfo {
	overflow: visible;
	display: table;
	width: 100%
}

.old-style .info_set .list_myinfo:after {
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden;
	content: ''
}

.old-style .info_set .list_myinfo .tit_set, .old-style .info_set .list_myinfo .txt_set
	{
	display: table-cell;
	vertical-align: top
}

.old-style .info_set .list_myinfo .tit_set {
	padding: 13px 6px 16px 10px
}

.old-style .list_myinfo .txt_set {
	width: 770px;
	padding: 10px 15px 10px;
	overflow: visible
}

.old-style .list_myinfo .wrap_item:after {
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden;
	content: ''
}

.old-style .list_myinfo .select_info {
	float: left
}

.old-style .list_myinfo .info_item {
	position: relative;
	float: left;
	height: 28px;
	padding: 0 10px;
	border: 1px solid #d4d4d4
}

.old-style .list_myinfo .lab_myinfo {
	position: absolute;
	top: 0;
	left: 10px;
	color: #919191;
	line-height: 27px
}

.old-style .list_myinfo .info_write .lab_myinfo {
	display: none
}

.old-style .list_myinfo .tf_myinfo {
	width: 100%;
	border: 0 none;
	height: 28px;
	line-height: 27px
}

.old-style .list_myinfo .txt_set .select_info .info_year {
	width: 78px
}

.old-style .list_myinfo .txt_set .select_info .info_month, .old-style .list_myinfo .txt_set .select_info .info_day
	{
	width: 48px;
	border-left: 0 none
}

.old-style .list_myinfo .txt_set .select_info .info_country {
	width: 65px
}

.old-style .list_myinfo .info_country .box_keyword, .old-style .list_myinfo .info_country .list_keyword
	{
	width: 502px
}

.old-style .list_myinfo .info_country .num_country {
	display: inline-block;
	color: #1e1e1e;
	width: 55px
}

.old-style .list_myinfo .select_info .info_phone {
	width: 396px;
	border-left: 0 none
}

.old-style .list_myinfo .link_date {
	position: absolute;
	top: 0;
	left: 10px;
	right: 10px;
	display: block;
	color: #919191;
	line-height: 27px
}

.old-style .list_myinfo .link_date:hover {
	text-decoration: none
}

.old-style .list_myinfo .link_date .ico_myinfo {
	position: absolute;
	top: 11px;
	right: 0;
	width: 9px;
	height: 5px;
	background-position: -88px 0
}

.old-style .list_myinfo .opt_open .link_date .ico_myinfo, .old-style .list_myinfo .start_open .box_start .link_date .ico_myinfo,
	.old-style .list_myinfo .end_open .box_end .link_date .ico_myinfo {
	background-position: -88px -12px
}

.old-style .list_myinfo .wrap_check {
	float: left;
	margin-top: 2px
}

.old-style .os_mac .list_myinfo .wrap_check {
	margin-top: 4px
}

.old-style .list_myinfo .wrap_check .item_check {
	float: left;
	position: relative;
	margin-left: 10px
}

.old-style .list_myinfo .wrap_radio .item_check:first-child {
	margin-left: 0
}

.old-style .list_myinfo .lab_check, .old-style .list_myinfo .lab_radio {
	display: block;
	font-size: 14px;
	line-height: 28px
}

.old-style .list_myinfo .lab_check {
	padding-right: 24px
}

.old-style .list_myinfo .lab_radio {
	padding-left: 24px
}

.old-style .list_myinfo .lab_check .ico_myinfo, .old-style .list_myinfo .lab_radio .ico_myinfo
	{
	position: absolute;
	top: 6px;
	width: 18px;
	height: 18px
}

.old-style .list_myinfo .lab_check .ico_myinfo {
	right: 0;
	margin-top: -1px;
	background-position: -44px 0
}

.old-style .list_myinfo .lab_radio .ico_myinfo {
	left: 0;
	background-position: -66px 0
}

.old-style .os_mac .list_myinfo .lab_check .ico_myinfo {
	margin-top: -4px
}

.old-style .os_mac .list_myinfo .lab_radio .ico_myinfo {
	margin-top: -2px
}

.old-style .list_myinfo .checked .lab_check .ico_myinfo {
	background-position: -44px -22px
}

.old-style .list_myinfo .checked .lab_radio .ico_myinfo {
	background-position: -66px -22px
}

.old-style .list_myinfo .inp_check, .old-style .list_myinfo .inp_radio {
	position: absolute;
	top: 6px;
	width: 18px;
	height: 18px;
	opacity: .01;
	filter: alpha(opacity = 1)
}

.old-style .list_myinfo .inp_check {
	right: 0
}

.old-style .list_myinfo .inp_radio {
	left: 0
}

.old-style .list_myinfo .box_keyword {
	display: none;
	position: absolute;
	top: 28px;
	left: -1px;
	width: 100%;
	z-index: 10;
	background-color: #fff;
	border: 1px solid #d4d4d4
}

.old-style .list_myinfo .opt_open {
	z-index: 15
}

.old-style .list_myinfo .opt_open .box_keyword, .old-style .list_myinfo .start_open .box_start .box_keyword,
	.old-style .list_myinfo .end_open .box_end .box_keyword {
	display: block
}

.old-style .list_myinfo .list_keyword {
	overflow-x: hidden;
	overflow-y: scroll;
	width: 100%;
	height: 148px;
	background-color: #fff
}

.old-style .list_myinfo .list_keyword li {
	height: 24px
}

.old-style .list_myinfo .list_keyword li:first-child {
	margin-top: 3px
}

.old-style .list_myinfo .list_keyword .link_txt {
	display: block;
	padding-left: 8px;
	line-height: 24px;
	text-decoration: none
}

.old-style .list_myinfo .list_keyword .on .link_txt, .old-style .list_myinfo .list_keyword .link_txt:hover
	{
	background-color: #f8f8f8
}

.old-style .list_myinfo .wrap_item .btn_profile {
	margin-top: 3px
}

.old-style .list_myinfo .wrap_identify {
	margin-top: 10px
}

.old-style .list_myinfo .wrap_phone .btn_profile, .old-style .txt_set .wrap_identify .btn_profile
	{
	margin-left: 10px
}

.old-style .list_myinfo .info_identify {
	width: 482px
}

.old-style .list_myinfo .btn_profile.btn_identify {
	background-color: #fae100
}

.old-style .list_myinfo .btn_profile.btn_disabled, .old-style .list_myinfo .btn_profile.btn_disabled:hover
	{
	background-color: #bababa
}

.old-style .list_myinfo .btn_profile.btn_identify:hover {
	background-color: #fad700
}

.old-style .list_myinfo .wrap_agree {
	float: none;
	overflow: hidden;
	margin: 10px 0 -5px
}

.old-style .list_myinfo .wrap_agree .item_check {
	margin-left: 0
}

.old-style .list_myinfo .add_detail {
	margin: 15px 0 -6px;
	padding: 20px 19px;
	background-color: #fafafa;
	border-top: 1px solid #d4d4d4
}

.old-style .list_myinfo .add_detail .tit_myinfo {
	float: left;
	width: 68px;
	margin-top: 5px;
	font-weight: normal
}

.old-style .list_myinfo .add_detail .wrap_item {
	position: relative;
	width: 100%;
	margin-bottom: 10px;
	z-index: 5
}

.old-style .list_myinfo .add_detail .wrap_company {
	margin-top: 20px;
	padding-top: 20px;
	border-top: 1px solid #d4d4d4
}

.old-style .list_myinfo .add_detail .info_item {
	width: 483px;
	background-color: #fff
}

.old-style .list_myinfo .add_detail .box_start, .old-style .list_myinfo .add_detail .box_end
	{
	float: left
}

.old-style .list_myinfo .add_detail .txt_between {
	float: left;
	margin: 5px 10px
}

.old-style .list_myinfo .add_detail .box_ing.box_end .info_item,
	.old-style .add_detail .box_ing.box_end .tf_myinfo {
	background-color: #f2f2f2
}

.old-style .list_myinfo .add_detail .box_ing .link_date {
	cursor: default
}

.old-style .list_myinfo .add_detail .box_ing .lab_check .ico_myinfo {
	background-position: -44px -22px
}

.old-style .list_myinfo .add_detail .box_end .item_check {
	margin-left: 10px
}

.old-style .list_myinfo .box_suggest {
	top: 29px;
	left: 68px;
	width: 503px
}

.old-style .list_myinfo .wrap_company .box_suggest {
	top: 49px
}

.old-style .list_myinfo .list_suggest {
	height: 203px
}

.old-style .list_myinfo .list_suggest li {
	width: 100%;
	height: auto;
	border-top: 1px solid #d4d4d4
}

.old-style .list_myinfo .list_suggest li:first-child {
	margin-top: 0;
	border-top: 0 none
}

.old-style .list_myinfo .list_suggest .link_txt {
	display: table;
	width: 468px;
	min-height: 24px;
	padding: 6px 10px;
	overflow: hidden;
	vertical-align: middle
}

.old-style .list_myinfo .list_suggest .link_txt:hover {
	text-decoration: none
}

.old-style .list_myinfo .list_suggest .info_thumb {
	display: table-cell;
	width: 1%;
	vertical-align: middle
}

.old-style .list_myinfo .list_suggest .info_txt {
	display: table-cell;
	width: 99%;
	vertical-align: middle
}

.old-style .list_myinfo .list_suggest .img_logo {
	display: block
}

.old-style .list_myinfo .list_suggest .tit_suggest {
	display: block;
	font-weight: normal;
	line-height: 1.3
}

.old-style .list_myinfo .list_suggest .txt_suggest {
	display: block;
	color: #767676;
	font-size: 12px;
	line-height: 1.4
}

.old-style .list_myinfo .add_detail .tit_school {
	display: block;
	margin: -5px 0 24px
}

.old-style .list_myinfo .add_detail .opt_open, .old-style .list_myinfo .add_detail .start_open,
	.old-style .list_myinfo .add_detail .end_open {
	z-index: 15
}

.old-style .layer_myinfo {
	width: auto;
	max-width: 440px;
	top: 268px;
	padding: 24px 20px 29px
}

.old-style .layer_myinfo .layer_head {
	margin-bottom: 10px
}

.old-style .layer_myinfo .layer_head .tit_layer {
	display: block;
	font-size: 20px;
	font-weight: bold
}

.old-style .layer_myinfo .layer_body {
	overflow: hidden;
	height: auto;
	vertical-align: top
}

.old-style .layer_myinfo .layer_body .btn_info, .old-style .layer_myinfo .layer_body .info_file
	{
	display: block;
	width: 260px;
	height: 40px;
	margin: 5px 10px 0;
	line-height: 38px;
	border: 1px solid #bababa;
	outline: 0
}

.old-style .layer_myinfo .layer_body .info_file {
	position: relative;
	width: 258px;
	height: 38px;
	text-align: center
}

.old-style .layer_myinfo .layer_body .lab_file {
	position: absolute;
	top: 0;
	left: 0;
	width: 258px;
	height: 38px
}

.old-style .layer_myinfo .layer_body .inp_file {
	position: absolute;
	top: 0;
	left: 0;
	width: 258px;
	height: 38px;
	opacity: .01;
	filter: alpha(opacity = 1)
}

.old-style .layer_myinfo .layer_foot {
	display: inline-block;
	overflow: hidden;
	height: auto;
	padding-top: 20px;
	vertical-align: top
}

.old-style .layer_myinfo .layer_foot .btn_complete {
	display: inline-block;
	width: auto;
	padding: 0 21px;
	height: 35px;
	border: 1px solid #adadad;
	border-radius: 4px;
	color: #555;
	font-weight: bold;
	letter-spacing: -1px;
	line-height: 16px
}

.old-style .layer_myinfo .list_agree {
	width: 396px;
	margin-top: 5px;
	border: 1px solid #d4d4d4
}

.old-style .layer_myinfo .list_agree>li {
	position: relative;
	overflow: hidden;
	min-height: 50px;
	border-top: 1px solid #d4d4d4
}

.old-style .layer_myinfo .list_agree .lab_check {
	display: inline-block;
	margin: 14px 50px 14px 19px
}

.old-style .layer_myinfo .list_agree .ico_myinfo {
	position: absolute;
	top: 13px;
	right: 19px;
	width: 24px;
	height: 24px;
	background-position: -20px -44px
}

.old-style .layer_myinfo .list_agree .checked .ico_myinfo {
	background-position: -20px -72px
}

.old-style .layer_myinfo .list_agree .inp_check {
	position: absolute;
	top: 13px;
	right: 19px;
	width: 24px;
	height: 24px;
	opacity: .01;
	filter: alpha(opacity = 1)
}

.old-style .layer_myinfo .list_agree li:first-child {
	border-top: 0 none
}

.old-style .layer_myinfo .desc_detail {
	width: 372px;
	margin-top: 30px;
	padding: 8px 18px 0 8px;
	border-top: 1px solid #d4d4d4;
	text-align: left;
	font-size: 12px;
	line-height: 22px
}

.old-style .layer_open .dimmed_agree, .old-style .layer_open .kakao_popup
	{
	display: block
}

.old-style .dimmed_agree {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .7;
	filter: alpha(opacity = 70);
	z-index: 100
}

.old-style .kakao_popup {
	display: none;
	overflow-y: auto;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 150
}

.old-style .kakao_popup .popup_confirm {
	display: table;
	width: 100%;
	height: 100%
}

.old-style .kakao_popup .wrap_agree {
	display: table-cell;
	padding: 60px 0;
	vertical-align: middle
}

.old-style .kakao_popup .cont_layer {
	position: relative;
	width: 500px;
	height: auto;
	background-color: #fff;
	margin: 0 auto
}

.old-style .kakao_popup .popup_head {
	overflow: hidden;
	height: 60px;
	background: #ffdc00
}

.old-style .kakao_popup .popup_body {
	overflow: hidden;
	height: 100%;
	text-align: center;
	width: 440px;
	padding: 34px 30px 40px
}

.old-style .kakao_popup .popup_head .tit_confirm {
	display: block;
	text-align: center;
	line-height: 60px;
	font-size: 20px;
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum;
	font-weight: normal
}

.old-style .kakao_popup .popup_body .tit_confirm {
	font-size: 24px;
	line-height: 36px;
	letter-spacing: -1px;
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum;
	font-weight: normal
}

.old-style .kakao_popup .btn_type2 {
	background: #d4d4d4;
	color: #777
}

.old-style .kakao_popup .btn_type2:hover {
	background: #d4d4d4;
	color: #777
}

.old-style .kakao_popup .btn_type3 {
	background: #ffdc00
}

.old-style .kakao_popup .btn_type3:hover {
	background: #ffcd00
}

.old-style .kakao_popup .ico_agree {
	display: inline-block;
	background-image:
		url("/assets/techin/ico_agree-b349f4aa296463d2a457843d4ddaa6cfc9fa7c0ea7dfb2cc8cb7e91ac088bd93.png");
	background-repeat: no-repeat;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px
}

.old-style .popup_myinfo .txt_myinfo {
	font-size: 14px;
	margin: 7px auto 29px;
	color: #767676;
	line-height: 20px
}

.old-style .popup_myinfo .txt_myinfo .link_more {
	color: #3c64e6;
	text-decoration: underline
}

.old-style .popup_myinfo .list_agree {
	border: 1px solid #d4d4d4
}

.old-style .popup_myinfo .list_agree>li {
	position: relative;
	overflow: hidden;
	min-height: 49px;
	text-align: left;
	border-top: 1px solid #d4d4d4
}

.old-style .popup_myinfo .list_agree .lab_check {
	display: inline-block;
	margin: 14px 110px 15px 19px;
	font-size: 14px;
	word-break: keep-all
}

.old-style .popup_myinfo .list_agree .lab_check .txt_case {
	color: #919191
}

.old-style .popup_myinfo .list_agree .ico_agree {
	position: absolute;
	top: 13px;
	right: 19px;
	width: 24px;
	height: 24px;
	background-position: 0 0
}

.old-style .popup_myinfo .list_agree .checked .ico_agree {
	background-position: 0 -28px
}

.old-style .popup_myinfo .list_agree .inp_check {
	position: absolute;
	top: 13px;
	right: 19px;
	width: 24px;
	height: 24px;
	opacity: .01;
	filter: alpha(opacity = 1)
}

.old-style .popup_myinfo .list_agree .link_more {
	position: absolute;
	top: 13px;
	right: 63px;
	border: 1px solid #bababa;
	border-radius: 11px;
	padding: 0 7px;
	font-size: 12px;
	line-height: 22px
}

.old-style .popup_myinfo .list_agree .link_more:hover {
	text-decoration: none;
	background-color: #f8f8f8
}

.old-style .popup_myinfo .list_agree li:first-child {
	border-top: 0 none
}

.old-style .popup_myinfo .list_agree li:first-child .lab_check {
	margin: 12px 100px 14px 19px;
	font-size: 16px;
	font-weight: bold
}

.old-style .popup_myinfo .list_agree .list_detail {
	padding: 10px 19px 19px;
	border-top: 1px solid #d4d4d4
}

.old-style .popup_myinfo .list_agree .list_detail li {
	margin-top: 3px;
	font-size: 12px;
	text-indent: -7px;
	padding-left: 7px;
	line-height: 18px
}

.old-style .popup_myinfo .btn_myinfo {
	position: relative;
	width: 100%;
	height: 70px;
	margin-top: 40px;
	font-size: 18px
}

.old-style .popup_myinfo .profile_set {
	position: relative;
	display: block;
	width: 110px;
	height: 110px;
	margin: 24px auto 16px
}

.old-style .popup_myinfo .img_profile {
	display: block;
	border-radius: 55px
}

.old-style .popup_myinfo .btn_photo {
	position: absolute;
	right: 0;
	bottom: 0;
	width: 40px;
	height: 40px;
	background-position: 0 -56px
}

.old-style .popup_myinfo .btn_photo:hover {
	background-position: 0 -100px
}

.old-style .photo_open .popup_myinfo .btn_photo {
	background-position: -44px -100px
}

.old-style .popup_myinfo .tit_name {
	font-size: 18px
}

.old-style .popup_myinfo .wrap_input {
	position: relative;
	margin-top: 43px;
	border: 1px solid #d4d4d4
}

.old-style .popup_myinfo .wrap_input .tit_myinfo {
	position: absolute;
	top: -29px;
	left: 0;
	font-size: 14px;
	font-weight: normal
}

.old-style .popup_myinfo .wrap_input .lab_myinfo {
	position: absolute;
	top: 0;
	left: 19px;
	line-height: 50px;
	font-size: 16px;
	color: #919191
}

.old-style .popup_myinfo .wrap_input .tf_myinfo {
	display: block;
	width: 400px;
	height: 50px;
	padding: 0 19px;
	margin: 0 auto;
	border: 0;
	background: 0;
	font-size: 16px;
	line-height: 48px
}

.old-style .popup_myinfo .list_info {
	display: block;
	margin: 22px 0 25px;
	color: #767676;
	line-height: 1.4;
	text-align: left
}

.old-style .popup_myinfo .list_info li {
	margin-top: 2px;
	font-size: 12px;
	text-indent: -7px;
	padding-left: 7px;
	line-height: 18px
}

.old-style .popup_myinfo .info_write .lab_myinfo {
	display: none
}

.old-style .popup_myinfo .list_input {
	overflow: hidden
}

.old-style .popup_myinfo .list_input li {
	position: relative;
	float: left;
	width: 108px;
	height: 50px;
	padding: 0 19px;
	line-height: 50px;
	text-align: left;
	z-index: 5
}

.old-style .popup_myinfo .list_input .inp_check {
	position: absolute;
	top: 13px;
	right: 20px;
	width: 24px;
	height: 24px;
	opacity: .01;
	filter: alpha(opacity = 1)
}

.old-style .popup_myinfo .list_input .lab_check {
	font-size: 16px;
	cursor: pointer
}

.old-style .popup_myinfo .list_input .ico_agree {
	position: absolute;
	top: 13px;
	right: 20px;
	width: 24px;
	height: 24px;
	cursor: pointer;
	background-position: 0 0
}

.old-style .popup_myinfo .list_input .checked .ico_agree {
	background-position: 0 -28px
}

.old-style .popup_myinfo .lab_radio .ico_agree {
	background-position: -28px 0
}

.old-style .popup_myinfo .checked .lab_radio .ico_agree {
	background-position: -28px -28px
}

.old-style .popup_myinfo .wrap_input .txt_bar {
	position: absolute;
	top: 15px;
	left: 0;
	background-color: #d4d4d4;
	width: 1px;
	height: 20px
}

.old-style .popup_myinfo .wrap_date .list_input li {
	width: 180px
}

.old-style .popup_myinfo .wrap_date .list_input li:first-child {
	width: 182px
}

.old-style .popup_myinfo .select_birth {
	height: 50px;
	border-bottom: 1px solid #d4d4d4
}

.old-style .popup_myinfo .select_birth:after {
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden;
	content: ''
}

.old-style .popup_myinfo .select_birth .tf_myinfo {
	width: 182px
}

.old-style .popup_myinfo .box_birth {
	float: left;
	position: relative;
	height: 50px;
	text-align: left;
	z-index: 10
}

.old-style .popup_myinfo .box_year {
	width: 220px
}

.old-style .popup_myinfo .box_month {
	width: 108px
}

.old-style .popup_myinfo .box_day {
	width: 110px
}

.old-style .popup_myinfo .box_birth .link_date {
	overflow: hidden;
	display: block;
	color: #919191;
	height: 50px;
	line-height: 50px;
	padding: 0 19px
}

.old-style .popup_myinfo .box_birth .link_date:hover {
	text-decoration: none
}

.old-style .popup_myinfo .box_birth .link_date .ico_agree {
	display: inline;
	background-position: -44px -68px;
	width: 12px;
	height: 6px;
	float: right;
	margin-top: 20px
}

.old-style .popup_myinfo .opt_open .link_date .ico_agree {
	background-position: -44px -56px
}

.old-style .popup_myinfo .box_keyword {
	display: none;
	position: absolute;
	top: 50px;
	left: 0;
	width: 109px;
	z-index: 10;
	background-color: #fff;
	border: 1px solid #d4d4d4
}

.old-style .popup_myinfo .opt_open {
	z-index: 15
}

.old-style .popup_myinfo .opt_open .box_keyword {
	display: block
}

.old-style .popup_myinfo .list_keyword {
	overflow-x: hidden;
	overflow-y: scroll;
	width: 109px;
	height: 158px;
	background-color: #fff
}

.old-style .popup_myinfo .list_keyword li {
	height: 30px
}

.old-style .popup_myinfo .list_keyword li:first-child {
	margin-top: 10px
}

.old-style .popup_myinfo .list_keyword .link_txt {
	display: block;
	padding-left: 20px;
	line-height: 30px
}

.old-style .popup_myinfo .list_keyword .link_txt:hover, .old-style .popup_myinfo .list_keyword .on .link_txt
	{
	background-color: #f8f8f8
}

.old-style .kakao_popup .btn_close {
	position: absolute;
	top: 17px;
	right: 23px;
	width: 27px;
	height: 27px
}

.old-style .kakao_popup .btn_close .ico_agree {
	display: block;
	width: 13px;
	height: 13px;
	margin: 7px auto;
	background-position: -60px -56px
}

.old-style .photo_open .layer_photo {
	display: block
}

.old-style .layer_photo {
	display: none;
	min-width: 138px;
	position: absolute;
	top: 280px;
	right: 124px;
	z-index: 9999;
	padding: 10px 20px 0;
	background-color: #fff;
	text-align: center;
	border: 1px solid #b4b4b4
}

.old-style .layer_photo .ico_arr {
	position: absolute;
	top: -13px;
	left: 50%;
	width: 20px;
	height: 14px;
	margin-left: -10px;
	background-position: -44px -80px
}

.old-style .layer_photo .list_photo li {
	margin-bottom: 5px
}

.old-style .layer_photo .list_photo .inp_file {
	display: block;
	width: 0;
	height: 0;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px
}

.old-style .layer_photo .list_photo .btn_info {
	font-size: 12px
}

.old-style .layer_photo li .btn_info:hover, .old-style .layer_photo .on .btn_info:hover
	{
	font-weight: bold;
	text-decoration: underline
}

.old-style .layer_logout .layer_head .tit_layer {
	font-size: 20px
}

.old-style .layer_logout .layer_body .desc_txt {
	font-size: 13px;
	text-align: center
}

.old-style .layer_foot .btn_logout {
	display: block;
	width: 182px;
	height: 40px;
	margin: 0 auto;
	background-color: #ffdc00;
	outline: 0 none
}

.old-style .layer_foot .btn_logout:hover {
	background-color: #ffcd00
}

.old-style .layer_foot .btn_logout2 {
	margin: 10px auto 0;
	background-color: #e6e6e6
}

.old-style .layer_foot .btn_logout2:hover {
	background-color: #ddd
}

.old-style .layer_account_type2 {
	position: absolute;
	left: 50%;
	padding: 48px 49px 34px;
	border-radius: 4px
}

.old-style .layer_account_type2 .subtit_layer {
	display: block;
	overflow: hidden;
	padding: 5px 0 7px;
	font-size: 18px;
	color: #5065aa;
	font-weight: bold;
	line-height: 20px;
	text-overflow: ellipsis;
	white-space: nowrap
}

.old-style .layer_account_type2 .subtit_layer+.tit_layer {
	margin-top: -18px;
	font-size: 18px
}

.old-style .layer_account_type2 .desc_txt {
	margin-top: -5px;
	font-size: 14px;
	color: #606060;
	text-align: center
}

.old-style .layer_account_type2 .layer_foot {
	display: inline-block;
	padding-top: 30px
}

.old-style .layer_account_type2 .btn_complete {
	float: left;
	width: 150px;
	height: 40px;
	margin-left: 13px;
	border-radius: 3px;
	color: #555;
	letter-spacing: -1px;
	line-height: 40px;
	background-color: #ffeb02
}

.old-style .layer_account_type2 .btn_complete:first-child {
	margin-left: 0
}

.old-style .layer_account_type3 {
	width: 338px;
	padding: 49px 40px 40px;
	border-radius: 3px
}

.old-style .layer_account_type3 .layer_head {
	margin-bottom: 27px
}

.old-style .layer_account_type3 .tit_layer {
	font-size: 18px;
	line-height: 27px;
	color: #1e1e1e
}

.old-style .layer_account_type3 .layer_body {
	text-align: center
}

.old-style .layer_account_type3 .link_layer {
	display: block;
	margin-top: -7px;
	font-size: 13px;
	color: #1e1e1e;
	text-decoration: underline
}

.old-style .layer_account_type3 .layer_foot {
	padding-top: 40px
}

.old-style .layer_account_type3 .btn_complete {
	width: 150px;
	height: 40px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 4px;
	background-color: #ffeb02
}

.old-style .layer_account_type3 .btn_close {
	position: absolute;
	top: 0;
	right: 0;
	width: auto;
	height: auto;
	padding: 20px;
	font-size: 0
}

.old-style .layer_account_type3 .ico_close {
	display: inline-block;
	width: 14px;
	height: 14px;
	background-position: 0 0;
	background:
		url("/assets/techin/ico_close-428f5d06dfd7cc46dcb8d023deb996759b3e94dfb307e2033b2daf5e4bb4c4ac.png")
		no-repeat 0 0
}

.old-style .wrap_kbtn {
	display: block;
	overflow: hidden;
	margin-top: 32px;
	font-size: 0;
	vertical-align: top
}

.old-style .wrap_kbtn .btn_kaccount {
	display: inline-block;
	width: 180px;
	height: 45px;
	margin: 0 5px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 3px;
	font-weight: bold;
	font-size: 14px;
	letter-spacing: -1px
}

.old-style .wrap_kbtn .btn_kaccount .txt_btn {
	display: block;
	height: 100%;
	line-height: 40px
}

.old-style .wrap_kbtn .btn_reset {
	border: 1px solid rgba(0, 0, 0, 0.05);
	background-color: #e6e6e6
}

.old-style .wrap_kbtn .btn_confirm {
	background-color: #ffeb02
}

.old-style .wrap_kbtn .btn_warn {
	width: 210px;
	color: #fff;
	background-color: #d21515
}

.old-style .wrap_kbtn .btn_disabled {
	border: 1px solid rgba(0, 0, 0, 0.05);
	color: #1e1e1e;
	background-color: #e6e6e6;
	opacity: .4
}

.old-style .wrap_dropout .wrap_kbtn {
	display: block
}

.old-style .wrap_inp {
	display: inline-block;
	position: relative;
	margin-top: 9px
}

.old-style .wrap_inp .box_inp {
	position: relative;
	width: 268px;
	height: 36px;
	margin-top: 11px;
	border: 1px solid #d4d4d4;
	border-radius: 2px;
	background-color: #fff;
	letter-spacing: -1px
}

.old-style .wrap_inp .box_inp:first-child {
	margin: 0
}

.old-style .wrap_inp .disabled {
	background-color: #f0f0f0
}

.old-style .box_inp .lab_info {
	position: absolute;
	top: 6px;
	left: 10px;
	line-height: 22px;
	color: #919191;
	z-index: 5
}

.old-style .info_write .lab_info {
	display: none
}

.old-style .wrap_inp .inp_info {
	position: absolute;
	top: 6px;
	left: 10px;
	width: 250px;
	height: 20px;
	line-height: 20px;
	border: none 0;
	color: #1e1e1e;
	letter-spacing: -1px
}

.old-style .disabled .inp_info {
	background-color: #f0f0f0
}

.old-style .wrap_inp2 {
	margin: 33px 0 10px
}

.old-style .wrap_inp .btn_modify {
	position: absolute;
	top: 50%;
	right: 8px;
	width: 41px;
	height: 24px;
	margin-top: -12px;
	border: 1px solid #d4d4d4;
	border-radius: 2px;
	font-size: 12px;
	background-color: #fafafa
}

.old-style .wrap_inp .btn_modify .txt_btn {
	display: block;
	margin-top: -2px
}

.old-style .list_account {
	overflow: hidden;
	margin: 0 -5px 0;
	padding-top: 3px
}

.old-style .list_account li {
	position: relative;
	float: left;
	width: 465px;
	margin: 5px;
	box-sizing: border-box
}

.old-style .wrap_box {
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	overflow: hidden;
	margin: 0 -5px
}

.old-style .wrap_box .box_kaccount {
	margin: 5px
}

.old-style .box_kaccount {
	overflow: hidden;
	width: 465px;
	margin: 0 auto;
	border: 1px solid #d4d4d4;
	box-sizing: border-box
}

.old-style .box_kaccount .tit_box {
	display: table;
	width: 100%;
	height: 49px;
	border-bottom: 1px solid #d4d4d4
}

.old-style .box_kaccount .tit_box .txt_box {
	display: table-cell;
	padding: 0 0 2px 20px;
	vertical-align: middle;
	text-align: left
}

.old-style .box_kaccount .tit_box .num_box, .old-style .box_kaccount .tit_box .link_box
	{
	display: table-cell;
	padding: 0 15px 2px 0;
	vertical-align: middle;
	text-align: right
}

.old-style .box_kaccount .tit_box .link_box {
	color: #5065aa;
	text-decoration: underline
}

.old-style .box_kaccount .link_box .ico_arr {
	display: inline-block;
	padding-left: 5px;
	background-color: #fff
}

.old-style .box_kaccount .list_box {
	overflow: hidden;
	width: 100%;
	padding: 0 20px;
	box-sizing: border-box;
	text-align: left
}

.old-style .box_kaccount .list_box li {
	padding: 14px 0;
	border-top: 1px solid #d4d4d4
}

.old-style .box_kaccount .list_box li:first-child {
	border-top: 0 none
}

.old-style .box_kaccount .list_box .wrap_thumb {
	display: table-cell;
	vertical-align: middle
}

.old-style .box_kaccount .list_box .img_thumb {
	display: block
}

.old-style .box_kaccount .list_box .name_thumb {
	display: table-cell;
	padding: 0 0 1px 10px;
	vertical-align: middle
}

.old-style .box_kaccount .list_box2 li {
	padding: 19px 0
}

.old-style .box_kaccount .desc_box {
	min-height: 88px;
	padding: 18px 20px 20px 19px;
	font-size: 13px;
	line-height: 16px;
	color: #767676;
	clear: both;
	text-align: left;
	box-sizing: border-box
}

.old-style .box_kaccount .list_item {
	float: left;
	width: 50%;
	height: 60px;
	padding: 20px;
	box-sizing: border-box
}

.old-style .box_kaccount .list_item2 {
	width: 100%
}

.old-style .box_kaccount .list_item+.list_item {
	border-left: 1px solid #d4d4d4
}

.old-style .box_kaccount .tit_item {
	float: left;
	font-size: 13px;
	color: #767676
}

.old-style .box_kaccount .desc_item {
	float: right;
	font-weight: bold
}

.old-style .box_delete {
	margin-top: 33px
}

.old-style .wrap_check {
	display: block;
	position: relative;
	font-size: 0
}

.old-style .wrap_check .lab_check {
	display: inline-block;
	font-size: 14px;
	line-height: 24px
}

.old-style .wrap_check .ico_check {
	float: left;
	width: 24px;
	height: 24px;
	margin-right: 10px;
	background-position: -20px -44px
}

.old-style .inp_checked .ico_check {
	background-position: -20px -72px
}

.old-style .wrap_check .txt_lab {
	display: block;
	overflow: hidden;
	line-height: 20px
}

.old-style .wrap_check .inp_check {
	position: absolute;
	top: 0;
	left: 0;
	width: 24px;
	height: 24px;
	opacity: .01;
	filter: alpha(opacity = 1);
	-webkit-appearance: none
}

.old-style .ico_dropout {
	width: 100px;
	height: 100px;
	margin: 60px auto 0;
	background-position: -100px 0
}

.old-style .wrap_dropout .name_account {
	display: block
}

.old-style .wrap_dropout .desc_account {
	padding: 5px 0 0 0
}

.old-style .wrap_dropout .wrap_inp2+.desc_account {
	padding-top: 3px;
	font-size: 13px;
	line-height: 16px;
	color: #767676
}

.old-style .wrap_dropout .desc_account2 {
	margin: -14px 0 27px;
	padding: 0
}

.old-style .wrap_dropout .tit_account {
	line-height: 30px
}

.old-style .wrap_dropout .ico_dropout+.tit_account {
	margin: 28px 0 30px
}

.old-style .kakao_layer {
	position: absolute;
	top: 183px;
	left: 50%;
	z-index: 80;
	margin-left: -210px
}

.old-style .kakao_layer .inner_account_layer {
	width: 420px;
	padding: 49px 40px 38px;
	background-color: #fff;
	box-sizing: border-box
}

.old-style .inner_account_layer .layer_body {
	text-align: center
}

.old-style .inner_account_layer .tit_layer {
	font-size: 18px
}

.old-style .inner_account_layer .desc_layer {
	padding-top: 10px;
	color: #606060
}

.old-style .inner_account_layer .box_kaccount {
	width: 100%;
	margin-top: 5px
}

.old-style .inner_account_layer .list_box {
	padding: 0 18px
}

.old-style .inner_account_layer .info_box {
	overflow: hidden;
	line-height: 20px
}

.old-style .inner_account_layer .info_box .tit_item {
	float: left;
	clear: both;
	font-size: 14px;
	color: #1e1e1e
}

.old-style .inner_account_layer .info_box .txt_item {
	float: left;
	padding-left: 5px
}

.old-style .inner_account_layer .wrap_inp {
	width: 100%;
	margin-top: 31px
}

.old-style .inner_account_layer .wrap_inp .box_inp {
	width: 100%;
	height: 38px;
	box-sizing: border-box
}

.old-style .inner_account_layer .wrap_inp .inp_info {
	width: 320px
}

.old-style .inner_account_layer .wrap_kbtn .btn_kaccount {
	width: 150px;
	height: 40px
}

.old-style .inner_account_layer .wrap_kbtn .txt_btn {
	line-height: 36px
}

.old-style .os_mac .wrap_inp .inp_info {
	top: 9px
}

.old-style .os_mac .box_inp .lab_info {
	top: 9px
}

.old-style .os_mac .box_kaccount .tit_box .txt_box {
	padding: 2px 0 0 20px
}

.old-style .os_mac .box_kaccount .tit_box .num_box, .old-style .os_mac .box_kaccount .tit_box .link_box
	{
	padding: 2px 15px 0 0
}

.old-style .os_mac .box_kaccount .desc_box {
	padding: 20px
}

.old-style .os_mac .box_kaccount .list_box .name_thumb {
	padding: 1px 0 0 10px
}

.old-style .os_mac .wrap_check .txt_lab {
	padding-top: 3px
}

.old-style .os_mac .wrap_kbtn .btn_kaccount .txt_btn {
	line-height: 46px
}

.old-style .os_mac .wrap_inp .btn_modify .txt_btn {
	margin-top: 2px
}

.old-style .os_mac .wrap_dropout .desc_account {
	padding-top: 7px
}

.old-style .os_mac .wrap_dropout .wrap_inp2+.desc_account {
	padding-top: 0
}

.old-style .os_mac .wrap_dropout .desc_account2 {
	margin: -12px 0 25px;
	padding: 0
}

.old-style .os_mac .inner_account_layer .wrap_kbtn .txt_btn {
	line-height: 40px
}

.old-style .os_mac #kakaoFoot {
	padding-top: 22px
}

.old-style .ico_agree {
	background-image:
		url("/assets/techin/ico_agree-b349f4aa296463d2a457843d4ddaa6cfc9fa7c0ea7dfb2cc8cb7e91ac088bd93.png")
}

.old-style .dimmed_layer {
	opacity: .6;
	filter: alpha(opacity = 60)
}

.old-style .layer_logout2 {
	border-radius: 3px
}

.old-style .layer_logout2 .layer_head {
	margin-bottom: 40px
}

.old-style .layer_logout2 .layer_head .tit_layer {
	font-size: 24px;
	letter-spacing: 0
}

.old-style .layer_logout2 .item_check {
	position: relative;
	margin-top: 23px
}

.old-style .layer_logout2 .item_check .lab_radio {
	display: block;
	padding-left: 28px;
	font-family: 'Kakao Regular', '맑은 고딕', 'Malgun Gothic',
		'Apple SD Gothic Neo', sans-serif, '돋움', dotum;
	font-size: 16px
}

.old-style .layer_logout2 .item_check .lab_radio .ico_agree {
	position: absolute;
	top: 3px;
	left: 0;
	width: 18px;
	height: 18px;
	background-position: -80px -28px
}

.old-style .layer_logout2 .checked .lab_radio .ico_agree {
	background-position: -80px 0
}

.old-style .layer_logout2 .item_check .inp_radio {
	position: absolute;
	top: 1px;
	left: 0;
	width: 18px;
	height: 18px;
	opacity: .01;
	filter: alpha(opacity = 1)
}

.old-style .layer_logout2 .desc_radio {
	margin: 5px 0 0 28px;
	font-size: 13px;
	color: #606060
}

.old-style .layer_logout2 .layer_foot .btn_confirm {
	width: 130px;
	height: 40px;
	font-weight: 400;
	background-color: #ffdc00;
	box-sizing: border-box
}

@charset "UTF-8";

div[data-role=page] {
	display: none
}

div[data-role=page].km-page-active {
	display: block
}

div[data-role=layer] {
	display: none
}

div[data-role=layer].layer_open {
	display: block
}

div[data-role=modal] {
	display: none
}

.km-email-recommend {
	display: none;
	overflow-y: auto;
	z-index: 100;
	width: 438px;
	padding: 10px 0;
	margin: 0 30px;
	border: 1px solid #b6b6b6;
	max-height: 180px;
	border-radius: 0 0 6px 6px
}

.km-email-recommend li {
	display: block;
	height: 34px;
	padding-left: 20px;
	font-size: 18px;
	line-height: 34px;
	text-align: left
}

.km-email-recommend li:hover {
	background: #f0f0f0;
	text-decoration: none
}

#pageRegisterBackup .km-input-wrapper.clearable {
	border-radius: 6px 6px 0 0
}

.km-dimmed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10000;
	background-color: rgba(0, 0, 0, 0.5)
}

.km-dimmed.darker {
	background-color: rgba(0, 0, 0, 0.7)
}

.txt_cancel {
	text-decoration: line-through
}

@font-face {
	font-family: NotoSans-Regular;
	font-style: normal;
	font-weight: normal;
	src:
		url("/assets/NotoSans-Regular-39e815186a41833da1b8cc366603a16d1f28d9aaea46737a330d16b37d5427f8.eot");
	src: local(☺),
		url("/assets/NotoSans-Regular-39e815186a41833da1b8cc366603a16d1f28d9aaea46737a330d16b37d5427f8.eot#iefix")
		format("embedded-opentype"),
		url("/assets/NotoSans-Regular-f0ee3ba6b2d732c631f4d221ee25de542d0a3e109e4fed1f294e435da4aa03f1.woff")
		format("woff"),
		url("/assets/NotoSans-Regular-85ade9c84e0fc0bb6d920ea1e3c9231590200ba0a79264968c6b9a0fb527a2fc.woff2")
		format("woff2"),
		url("/assets/NotoSans-Regular-99327cf663f169cdd5b8e8dba578fe3eb3ba635e65186ec7a2cfc58fa181bd15.otf")
		format("truetype")
}

@font-face {
	font-family: NotoSans-Bold;
	font-style: normal;
	font-weight: normal;
	src:
		url("/assets/NotoSans-Bold-97646ab8f2ae3f3a5aa6619fc9ac87dd749cb3902c621f094ec45ae4eeee7605.eot");
	src: local(☺),
		url("/assets/NotoSans-Bold-97646ab8f2ae3f3a5aa6619fc9ac87dd749cb3902c621f094ec45ae4eeee7605.eot#iefix")
		format("embedded-opentype"),
		url("/assets/NotoSans-Bold-f6cfb0159bf1f9c6e22c04ca69fac98b34f9476bfbe93ad5d8a02d08a460b31e.woff")
		format("woff"),
		url("/assets/NotoSans-Bold-06939e852b59474a2134e644c56e8bd2bd10f2d3997ec4afb2301e8b977b61b2.woff2")
		format("woff2"),
		url("/assets/NotoSans-Bold-47a2122b0f601355c4675246e6705520f3b81ec44f55634afb0d2edbc1558194.otf")
		format("truetype")
}

body, th, td, input, select, textarea, button {
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, '맑은 고딕',
		Malgun Gothic, '돋움', dotum, sans-serif
}

html:lang(ko) .link_gnb, html:lang(en) .link_gnb {
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, '맑은 고딕',
		Malgun Gothic, '돋움', dotum, sans-serifr
}

.ico_agree, .ico_myinfo, .ico_login {
	background-image:
		url("/assets/weblogin/techin/ico_account-4038b4e6064e4e8399ed0cf002a5b2f4262aed369aeab218e019ead3689755f4.png")
}

.manage_comm {
	height: 100%;
	font-size: 14px;
	letter-spacing: 0;
	color: #252525
}

.manage_comm #kakaoWrap {
	position: relative;
	min-width: 1280px;
	min-height: 100%
}

.manage_comm #kakaoContent {
	padding-bottom: 140px
}

.manage_comm #kakaoHead {
	overflow: visible;
	position: relative;
	height: 57px;
	border-bottom: 1px solid #ebebeb;
	background-color: transparent;
	text-align: center
}

.manage_comm #kakaoHead .wrap_head {
	position: relative;
	width: 1200px;
	margin: 0 auto
}

.manage_comm #kakaoHead h1 {
	position: absolute;
	top: 17px;
	left: 0;
	z-index: 10;
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, '맑은 고딕',
		Malgun Gothic, '돋움', dotum, sans-serif
}

.manage_comm #kakaoHead .link_logo {
	float: left;
	height: 22px;
	margin-top: 2px;
	font-size: 15px;
	color: #252525
}

.manage_comm #kakaoHead .logo_kakao {
	float: left;
	margin-right: 6px
}

.manage_comm #kakaoHead .service_kakao {
	float: left;
	font-weight: normal;
	font-size: 15px
}

.manage_comm #kakaoGnb {
	width: 600px;
	height: 58px;
	margin: 0 auto
}

.manage_comm #kakaoGnb .list_gnb {
	display: inline-block;
	overflow: hidden;
	height: 58px
}

.manage_comm #kakaoGnb .list_gnb li {
	float: left;
	margin-left: 35px
}

.manage_comm #kakaoGnb .list_gnb li:first-child {
	margin-left: 0
}

.manage_comm .link_gnb {
	display: block;
	height: 39px;
	padding: 19px 5px 0;
	letter-spacing: 0
}

.on .link_gnb, .link_gnb:hover {
	height: 37px;
	border-bottom: 2px solid #333
}

#kakaoHead .info_login {
	overflow: hidden;
	position: absolute;
	top: 22px;
	right: 0;
	font-size: 12px;
	z-index: 10;
	color: #7c7c7c
}

.info_login .txt_nick {
	float: left
}

.info_login .txt_call {
	float: left;
	padding-left: 5px
}

.info_login .txt_kaccount {
	float: left
}

.info_login .txt_kaccount:after {
	content: '';
	float: left;
	width: 1px;
	height: 8px;
	margin: 6px 10px 0;
	background-color: #7c7c7c
}

.info_login .txt_kaccount .txt_id {
	float: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: right
}

.info_login .txt_kaccount .txt_email {
	float: left
}

.info_login .txt_bar {
	float: left;
	width: 1px;
	height: 14px;
	margin: 3px 10px 0;
	background-color: #505050
}

.info_login .link_login {
	float: left;
	font-weight: bold
}

.info_login .link_logout {
	color: #7c7c7c;
	text-decoration: underline
}

.manage_comm #kakaoFoot {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px;
	padding: 20px 0 60px;
	border-top: 1px solid #e6e6e6;
	font-size: 12px;
	text-align: center;
	letter-spacing: -0.03em
}

.footer_comm .service_info {
	font-size: 0
}

.footer_comm .item_select {
	display: inline-block;
	min-width: 53px;
	padding: 0 10px;
	text-align: left
}

.footer_comm .item_select .link_selected {
	height: auto;
	line-height: 20px;
	font-size: 12px
}

.footer_comm .item_select .link_selected .ico_arr {
	display: inline-block;
	width: 9px;
	height: 6px;
	margin: 7px 0 0 4px;
	background-position: 0 -60px
}

.footer_comm .item_select .list_select {
	top: auto;
	bottom: -12px;
	min-width: 90px
}

.footer_comm .link_info {
	display: inline-block;
	padding: 0 10px;
	line-height: 20px;
	font-size: 12px;
	color: #4c4c4c
}

.footer_comm .link_policy {
	font-family: NotoSans-Bold, NotoSans-Regular, AppleSDGothicNeo-Regular,
		"맑은 고딕", Malgun Gothic, "돋움", dotum, sans-serif
}

.footer_comm .txt_copyright {
	display: block;
	margin-top: 8px;
	line-height: 18px;
	font-size: 11px;
	color: #7c7c7c;
	letter-spacing: 0
}

.footer_comm .link_kakao {
	font-family: NotoSans-Bold, NotoSans-Regular, AppleSDGothicNeo-Regular,
		"맑은 고딕", Malgun Gothic, "돋움", dotum, sans-serif;
	color: inherit
}

.item_select {
	position: relative;
	padding-right: 0
}

.item_select .link_selected {
	display: block;
	height: 48px;
	line-height: 47px
}

.item_select .link_selected .ico_arr {
	width: 12px;
	height: 12px;
	margin: 17px 0 0 8px;
	background-position: -180px -30px
}

.item_select span.link_selected {
	color: #b2b2b2
}

.item_select .list_select {
	overflow-y: auto;
	display: none;
	position: absolute;
	top: 40px;
	z-index: 10;
	max-height: 160px;
	border: 1px solid #eee;
	border-radius: 2px;
	font-size: 13px;
	background-color: #fff;
	-webkit-box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2);
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2)
}

.item_select .link_select {
	overflow: hidden;
	display: block;
	height: 40px;
	padding: 0 15px;
	line-height: 40px;
	color: #252525;
	white-space: nowrap;
	text-overflow: ellipsis
}

.item_select .link_select:hover {
	background-color: #eee
}

.footer_link {
	height: 18px
}

.footer_link .link_info {
	display: inline-block;
	margin-right: 20px;
	color: #4c4c4c
}

.footer_link .link_policy {
	font-family: NotoSans-Bold, NotoSans-Regular, AppleSDGothicNeo-Regular,
		"맑은 고딕", Malgun Gothic, "돋움", dotum, sans-serif
}

.footer_link .txt_bar {
	display: none
}

.footer_info {
	margin-top: 15px;
	color: #7c7c7c
}

.footer_info .txt_copyright {
	font-size: 11px
}

.footer_info .link_kakao {
	font-weight: bold;
	color: #7c7c7c
}

.util_cont {
	position: relative;
	display: inline-block
}

.util_cont .btn_info {
	font-size: 12px;
	vertical-align: top
}

.util_cont .ico_arr {
	display: inline-block;
	width: 10px;
	height: 6px;
	margin: 8px 0 0 5px;
	background-position: 0 -70px;
	vertical-align: top
}

.util_cont .cont_util {
	display: none;
	position: absolute;
	bottom: -9px;
	left: -12px;
	width: 78px;
	background-color: #fff;
	border: 1px solid #ddd
}

.util_lang .cont_util {
	display: block
}

.cont_util .item_lang {
	display: block;
	height: 32px
}

.cont_util .item_lang .link_lang {
	display: block;
	padding: 0 10px;
	line-height: 32px;
	text-align: left
}

.cont_util .on .link_lang, .cont_util .item_lang .link_lang:hover {
	background-color: #eee;
	text-decoration: none
}

.list_state {
	margin-top: 20px
}

.list_state li {
	margin-top: 20px;
	font-size: 12px
}

.list_state li:first-child {
	margin-top: 0
}

.list_state .link_state {
	display: inline-block;
	position: relative;
	padding-right: 16px;
	color: #4f66aa;
	vertical-align: top;
	text-decoration: underline
}

.list_state .link_state .ico_arr {
	position: absolute;
	top: 5px;
	right: 0;
	width: 7px;
	height: 10px
}

.wrap_account .desc_txt2 {
	margin-bottom: -16px
}

.old-style .wrap_kaccount .info_app {
	border-bottom: 0
}

.old-style .info_set {
	margin-top: 0
}

.old-style .list_set {
	border-top: 1px solid #d4d4d4
}

.old-style .list_set .tit_set {
	width: 104px;
	padding: 16px 6px 16px 10px;
	font-size: 16px;
	color: #252525
}

.old-style .list_set .txt_set {
	padding: 16px 8px 16px 20px
}

.old-style .list_set .manage_btn {
	top: 16px;
	right: 8px
}

.old-style .service_date .txt_set {
	padding-right: 180px
}

.old-style .info_set .list_set .inner_txt {
	float: none;
	margin: 0;
	padding: 0;
	border-bottom: 0 none;
	font-size: 16px;
	line-height: 1.5
}

.old-style .info_set .btn_set {
	margin: 0;
	border: 1px solid #e0e0e0;
	background-color: #fff;
	color: #252525
}

.old-style .info_set .list_set .inner_txt2 {
	position: absolute;
	top: 16px;
	right: 8px
}

.old-style .info_set .list_set .inner_txt2 .btn_set {
	float: left;
	margin-left: 4px
}

.old-style .info_set .link_terms {
	text-decoration: underline;
	color: #252525
}

.old-style .access_right .inner_txt+.inner_txt {
	margin-top: 16px
}

.old-style .access_right .btn_set {
	float: none;
	margin-top: 0;
	border: 1px solid #e0e0e0;
	vertical-align: top;
	background-color: #ffff
}

.old-style .access_info>div {
	position: relative;
	padding-right: 80px
}

.old-style .access_info>div+div {
	margin-top: 16px
}

.old-style .access_info .btn_set {
	position: absolute;
	top: 0;
	right: 0
}

.old-style .wrap_btn {
	margin-top: 40px
}

.old-style .wrap_btn .btn_account {
	width: 380px;
	height: 50px;
	color: #252525;
	background-color: #ffe500
}

.old-style .wrap_email .tf_txt {
	display: inline-block;
	width: 272px;
	height: 38px;
	padding: 0 39px 0 15px;
	font-weight: bold;
	border: 1px solid #d4d4d4;
	border-radius: 3px;
	line-height: 38px;
	box-sizing: border-box
}

.old-style .layer_body .wrap_email {
	margin-top: 10px
}

.old-style .layer_body .wrap_email .tf_txt {
	width: 100%
}

.popup {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1000;
	padding: 40px;
	font-size: 0;
	text-align: center
}

.popup .layer_account {
	width: 420px;
	padding: 50px 30px 40px;
	border: 0 none;
	border-radius: 3px;
	box-sizing: border-box
}

.popup .layer_head {
	margin-bottom: 20px
}

.popup .layer_head .tit_layer {
	font-size: 18px;
	line-height: 1.5
}

.popup .layer_body .desc_txt {
	font-size: 14px;
	color: #606060
}

.popup .layer_body .tit_app {
	font-size: 14px;
	color: #606060
}

.popup .layer_body .txt_app {
	font-size: 14px;
	color: #606060;
	opacity: .5
}

.popup .layer_body .desc_app {
	margin-top: 10px;
	font-size: 14px;
	color: #606060
}

.popup .layer_foot {
	padding: 0;
	margin-top: 20px
}

.popup .layer_foot .btn_send {
	width: 100%;
	height: 44px;
	border-radius: 4px;
	font-size: 15px;
	background-color: #ffe500;
	color: #252525
}

.popup .layer_foot .btn_send+.btn_send {
	margin-top: 8px
}

.popup .layer_foot .btn_send.submit {
	background-color: #eee
}

.popup .layer_foot .btn_close .ico_account {
	width: 18px;
	height: 18px;
	background-image:
		url("/assets/weblogin/techin/ico_account-4038b4e6064e4e8399ed0cf002a5b2f4262aed369aeab218e019ead3689755f4.png");
	background-position: -70px -60px
}

.popup .layer_logout .layer_foot {
	margin-top: 40px
}

.popup .layer_logout .layer_foot .btn_send.submit {
	background-color: #ffe500
}

.popup .layer_alert .desc_app {
	text-align: center
}

.dimmed_layer {
	display: block
}

.kakao_layer {
	max-width: initial;
	margin: 0
}

.kakao_layer .wrap_btn {
	display: block;
	overflow: inherit;
	margin-left: 0
}

.kakao_layer .layer_foot {
	padding: 0
}

.kakao_layer .btn_close {
	width: auto;
	height: auto
}

.kakao_layer .btn_close .ico_close {
	margin: 0
}

#requiredSignupInfoForm .type_newmail .tf_g {
	padding-right: 125px
}

@media only screen and (-webkit-min-device-pixel-ratio:1.5) , only screen and
		(min-device-pixel-ratio:1.5) , only screen and
	(min-resolution:1.5dppx) {
	.ico_agree, .ico_myinfo, .ico_login {
		background-image:
			url("/assets/weblogin/techin/retina/ico_account-5bbf49f20922943cc44d5b2b6a36d5441231a95d2903df29763b18f87cc20103.png");
		-webkit-background-size: 200px 220px;
		background-size: 200px 220px
	}
}

@charset "UTF-8";

div[data-role=page] {
	display: none
}

div[data-role=page].km-page-active {
	display: block
}

div[data-role=layer] {
	display: none
}

div[data-role=layer].layer_open {
	display: block
}

div[data-role=modal] {
	display: none
}

.km-email-recommend {
	display: none;
	overflow-y: auto;
	z-index: 100;
	width: 438px;
	padding: 10px 0;
	margin: 0 30px;
	border: 1px solid #b6b6b6;
	max-height: 180px;
	border-radius: 0 0 6px 6px
}

.km-email-recommend li {
	display: block;
	height: 34px;
	padding-left: 20px;
	font-size: 18px;
	line-height: 34px;
	text-align: left
}

.km-email-recommend li:hover {
	background: #f0f0f0;
	text-decoration: none
}

#pageRegisterBackup .km-input-wrapper.clearable {
	border-radius: 6px 6px 0 0
}

.km-dimmed {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10000;
	background-color: rgba(0, 0, 0, 0.5)
}

.km-dimmed.darker {
	background-color: rgba(0, 0, 0, 0.7)
}

.txt_cancel {
	text-decoration: line-through
}

body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code,
	form, fieldset, legend, textarea, p, blockquote, th, td, input, select,
	button {
	margin: 0;
	padding: 0
}

fieldset, img {
	border: 0 none
}

fieldset {
	min-width: 0;
	max-width: 100%;
	width: 100%
}

dl, ul, ol, menu, li {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

input, select, textarea, button {
	vertical-align: middle
}

input::-ms-clear {
	display: none
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer
}

body {
	background: #fff;
	-webkit-text-size-adjust: none
}

body, th, td, input, select, textarea, button {
	font-size: 16px;
	line-height: 1.5;
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕",
		Malgun Gothic, "돋움", dotum, sans-serif;
	color: #7c7c7c;
	letter-spacing: -0.03em;
	word-wrap: break-word
}

a {
	color: #4c4c4c;
	text-decoration: none
}

a:active, a:hover {
	text-decoration: none
}

a:active {
	background-color: transparent
}

address, caption, cite, code, dfn, em, var {
	font-style: normal;
	font-weight: normal
}

label, button, a, input {
	-webkit-tap-highlight-color: rgba(255, 255, 255, 0)
}

@font-face {
	font-family: NotoSans-Regular;
	font-style: normal;
	font-weight: normal;
	src:
		url("/assets/NotoSans-Regular-39e815186a41833da1b8cc366603a16d1f28d9aaea46737a330d16b37d5427f8.eot");
	src: local(☺),
		url("/assets/NotoSans-Regular-39e815186a41833da1b8cc366603a16d1f28d9aaea46737a330d16b37d5427f8.eot#iefix")
		format("embedded-opentype"),
		url("/assets/NotoSans-Regular-f0ee3ba6b2d732c631f4d221ee25de542d0a3e109e4fed1f294e435da4aa03f1.woff")
		format("woff"),
		url("/assets/NotoSans-Regular-85ade9c84e0fc0bb6d920ea1e3c9231590200ba0a79264968c6b9a0fb527a2fc.woff2")
		format("woff2"),
		url("/assets/NotoSans-Regular-99327cf663f169cdd5b8e8dba578fe3eb3ba635e65186ec7a2cfc58fa181bd15.otf")
		format("truetype")
}

@font-face {
	font-family: NotoSans-Medium;
	font-style: normal;
	font-weight: normal;
	src:
		url("/assets/NotoSansKR-Medium-23fa4a870f1674f4b667c78c056177c1d80126862b4ca03309de43765927ae78.eot");
	src: local(☺),
		url("/assets/NotoSansKR-Medium-23fa4a870f1674f4b667c78c056177c1d80126862b4ca03309de43765927ae78.eot#iefix")
		format("embedded-opentype"),
		url("/assets/NotoSansKR-Medium-e5da6f661c0cf2ffda401303ab7f605dd7663dc3878cc76293c381477990469f.woff")
		format("woff"),
		url("/assets/NotoSansKR-Medium-9687c40bf6cc637030719a789ce3be63a0912d3af30201c1898cd51e2f711b6c.woff2")
		format("woff2")
}

@font-face {
	font-family: NotoSans-Bold;
	font-style: normal;
	font-weight: normal;
	src:
		url("/assets/NotoSans-Bold-97646ab8f2ae3f3a5aa6619fc9ac87dd749cb3902c621f094ec45ae4eeee7605.eot");
	src: local(☺),
		url("/assets/NotoSans-Bold-97646ab8f2ae3f3a5aa6619fc9ac87dd749cb3902c621f094ec45ae4eeee7605.eot#iefix")
		format("embedded-opentype"),
		url("/assets/NotoSans-Bold-f6cfb0159bf1f9c6e22c04ca69fac98b34f9476bfbe93ad5d8a02d08a460b31e.woff")
		format("woff"),
		url("/assets/NotoSans-Bold-06939e852b59474a2134e644c56e8bd2bd10f2d3997ec4afb2301e8b977b61b2.woff2")
		format("woff2"),
		url("/assets/NotoSans-Bold-47a2122b0f601355c4675246e6705520f3b81ec44f55634afb0d2edbc1558194.otf")
		format("truetype")
}

#kakaoIndex {
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 0;
	height: 1px;
	margin: 0;
	padding: 0
}

.ir_pm {
	display: block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px
}

.ir_wa {
	display: block;
	overflow: hidden;
	position: relative;
	z-index: -1;
	width: 100%;
	height: 100%
}

.ir_caption {
	overflow: hidden;
	width: 1px;
	font-size: 1px;
	line-height: 0;
	text-indent: -9999px
}

.screen_out {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px
}

.screen_hidden {
	overflow: hidden;
	position: relative;
	top: 0;
	left: 0;
	width: 1px;
	height: 1px;
	margin-top: -1px;
	line-height: 0;
	text-indent: -9999px
}

.show {
	display: block
}

.hide {
	display: none
}

.img_g {
	display: inline-block;
	vertical-align: top;
	width: 200%
}

.link_g {
	display: inline-block;
	text-decoration: underline
}

.link_g:hover {
	text-decoration: underline
}

.ico_account {
	display: inline-block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	vertical-align: top;
	background:
		url("/assets/weblogin/techin/ico_account-4038b4e6064e4e8399ed0cf002a5b2f4262aed369aeab218e019ead3689755f4.png")
}

.ico_accountcheck {
	display: inline-block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	vertical-align: top;
	background:
		url("/assets/weblogin/techin/ico_accountcheck-5adb29f1bbff0b28d84089047be030b58cb2a91863d3700dc3c7b022488a5c01.png")
}

.ico_tip {
	width: 36px;
	height: 20px;
	background-position: -20px -170px
}

.ico_tip2 {
	width: 30px;
	height: 16px;
	background-position: -20px -200px
}

.ico_check2 {
	width: 12px;
	height: 10px;
	background-position: -110px -180px
}

html {
	height: 100%
}

#kakaoContent, #mArticle {
	display: block
}

.account_comm {
	display: table;
	width: 100%;
	min-width: 320px;
	height: 100%;
	border-collapse: separate
}

.account_comm #kakaoWrap {
	position: relative;
	display: table-cell;
	height: 100%;
	vertical-align: middle;
	padding: 50px 0
}

.account_comm #kakaoHead {
	max-width: 520px;
	text-align: center;
	margin: 0 auto
}

.account_comm #kakaoFoot {
	text-align: center;
	margin: 0 auto
}

.account_comm #mArticle {
	position: relative;
	max-width: 580px;
	min-height: 520px;
	margin: 40px auto;
	padding: 58px 69px 139px;
	border: 1px solid #e5e5e5;
	border-radius: 2px;
	box-sizing: border-box
}

.account_type1 #mArticle {
	max-width: 520px
}

.account_type2 #mArticle {
	max-width: 520px;
	padding-bottom: 49px
}

.account_type3 #mArticle {
	max-width: 450px
}

.account_type3 .cont_merge #mArticle {
	padding: 59px 39px 129px 39px
}

.account_type3 .cont_merge .tit_step {
	margin-bottom: 10px
}

.account_type3 .cont_merge .fld_apply {
	margin-top: 0
}

.account_type3 .wrap_btn3 {
	right: 39px;
	bottom: 39px;
	left: 39px
}

.type_popup #kakaoContent #mArticle {
	max-width: 520px;
	min-height: auto;
	padding-bottom: 50px
}

.popup .kakao_layer .inner_terms_layer .layer_head {
	display: block;
	font-size: 24px;
	color: #404040;
	line-height: 26px;
	letter-spacing: -1px;
	word-break: keep-all;
	font-weight: normal
}

.popup .kakao_layer .inner_terms_layer .desc_layer {
	font-size: 12px;
	color: #4a4a4a
}

.popup .kakao_layer .inner_terms_layer .tit_desc {
	margin-top: 15px;
	font-weight: bold;
	font-size: 14px;
	color: #404040
}

.popup .kakao_layer .inner_terms_layer .desc_agree {
	font-size: 12px;
	color: #7c7c7c;
	margin: 15px 0 0
}

.popup .kakao_layer .inner_terms_layer .tbl_agree {
	width: 100%;
	margin-top: 15px;
	table-layout: auto;
	border-collapse: collapse;
	border-spacing: 0;
	border-bottom: 1px solid #ccc
}

.popup .kakao_layer .inner_terms_layer .tbl_agree th {
	height: 50px;
	padding: 11px 17px;
	font-size: 12px;
	color: #606060;
	text-align: center;
	border: solid #ccc;
	border-width: 1px 0 0 1px;
	background-color: #fafafa;
	letter-spacing: 0
}

.popup .kakao_layer .inner_terms_layer .tbl_agree th:first-child {
	border-left: 0 none
}

.popup .kakao_layer .inner_terms_layer .tbl_agree td {
	padding: 15px 10px;
	border: solid #ccc;
	border-width: 1px 0 0 1px;
	letter-spacing: 0;
	font-size: 12px;
	color: #606060;
	vertical-align: top;
	text-align: center;
	word-spacing: -1px
}

.popup .kakao_layer .inner_terms_layer .tbl_agree td:first-child {
	border-left: 0 none
}

.fld_g .desc_check {
	padding: 6px 2px 0 28px;
	font-size: 12px;
	color: #959595;
	word-break: keep-all
}

.fld_g .desc_check2 {
	padding-bottom: 20px;
	border-bottom: 1px solid #e5e5e5;
	font-size: 14px;
	color: #252525
}

.fld_g .item_check {
	margin-top: 20px
}

.fld_g .list_desc {
	margin-top: 11px;
	color: #999
}

.fld_g .list_desc li {
	margin-top: 4px
}

.item_inp {
	position: relative
}

.item_inp.email_done .tf_g {
	padding-right: 95px
}

.item_inp .link_more {
	position: absolute;
	right: 0;
	top: 0;
	font-size: 13px;
	color: #7c7c7c;
	text-decoration: underline
}

.item_inp .link_more .ico_arr {
	width: 8px;
	height: 13px;
	margin: 5px 4px 4px 8px;
	background-position: -190px -100px
}

.item_inp .dimmed_inp {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 2px;
	background-color: #fff;
	opacity: .6;
	filter: alpha(opacity = 60);
	z-index: 10
}

.item_inp .btn_help {
	position: absolute;
	right: 0;
	top: 0
}

.inp_g {
	position: absolute;
	top: 0;
	left: 0;
	width: 20px;
	height: 20px;
	opacity: .01;
	filter: alpha(opacity = 1)
}

.lab_g {
	overflow: hidden;
	position: relative;
	display: block;
	font-size: 15px;
	color: #4c4c4c;
	cursor: pointer
}

.inp_g[disabled=disabled]+.lab_g {
	cursor: default;
	color: #b2b2b2
}

.item_check {
	padding-right: 30px
}

.item_check2 .lab_check .txt_check {
	font-size: 14px;
	line-height: 1.5
}

.item_check2 .lab_check .ico_check2 {
	float: left;
	margin: 6px 12px 0 4px
}

.inp_check {
	top: 1px
}

.lab_check .ico_check {
	float: left;
	width: 20px;
	height: 20px;
	margin: 1px 8px 0 0;
	background-position: -30px -30px
}

.lab_check .txt_check {
	overflow: hidden;
	display: block;
	font-size: 15px;
	line-height: 22px;
	color: #252525
}

.lab_check .txt_checkall {
	font-family: NotoSans-Bold, sans-serif;
	color: #333;
	font-size: 17px;
	line-height: 22px
}

.item_on .lab_check .ico_check {
	background-position: 0 -30px
}

.item_on .lab_check .ico_check2 {
	background-position: -110px -170px
}

.item_radio {
	height: 48px;
	line-height: 47px
}

.item_radio:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.inp_radio {
	top: 13px
}

.lab_radio .ico_radio {
	float: left;
	width: 20px;
	height: 20px;
	margin: 13px 6px 0 0;
	background-position: -90px -30px
}

.wrap_tooltip {
	position: relative
}

.wrap_tooltip .btn_help {
	display: inline-block;
	position: static
}

.wrap_tooltip .tooltip_comm {
	top: 32px;
	left: -123px;
	width: 260px;
	line-height: 18px
}

.wrap_tooltip .tooltip_comm .ico_arr {
	left: 125px
}

.item_radio2 {
	height: 40px;
	padding: 0;
	line-height: 40px
}

.item_radio2 .inp_radio {
	top: 10px
}

.item_radio2 .ico_radio {
	margin: 10px 10px 0 0
}

.item_radio2 .txt_radio {
	font-family: NotoSans-Bold, sans-serif
}

.item_radio3 {
	height: 40px;
	padding: 0;
	line-height: 40px
}

.item_radio3 .inp_radio {
	top: 10px
}

.item_radio3 .lab_radio {
	font-size: 16px;
	padding-left: 30px
}

.item_radio3 .ico_radio {
	position: absolute;
	top: 10px;
	left: 0;
	margin: 0
}

.item_radio3 .txt_radio {
	font-family: NotoSans-Bold, sans-serif
}

.item_on .lab_radio .ico_radio {
	background-position: -60px -30px
}

.item_select {
	position: relative;
	padding-right: 0
}

.item_select .link_selected {
	position: relative;
	display: block;
	height: 48px;
	line-height: 47px
}

.item_select .link_selected .ico_arr {
	width: 12px;
	height: 10px;
	margin: 17px 0 0 8px;
	background-position: -180px -30px
}

.item_select span.link_selected {
	color: #b2b2b2
}

.item_select .list_select {
	display: none;
	position: absolute;
	top: 40px;
	max-height: 160px;
	overflow-y: auto;
	font-size: 13px;
	border: 1px solid #eee;
	border-radius: 2px;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2);
	background-color: #fff;
	z-index: 10
}

.item_select .link_select {
	height: 40px;
	padding: 0 15px;
	color: #252525;
	line-height: 40px;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis
}

.item_select .link_select:hover {
	background-color: #eee
}

.select_open .link_selected .ico_arr {
	background-position: -180px -50px
}

.select_open .list_select {
	display: block
}

.item_tf {
	position: relative;
	padding-right: 0
}

.item_tf+.item_tf {
	margin-top: 10px
}

.item_tf.item_select {
	border-bottom: 2px solid #ebebeb
}

.item_tf.item_select .link_selected {
	overflow: hidden
}

.item_tf.item_select .ico_arr {
	float: right
}

.item_tf.item_select .list_select {
	width: 100%
}

.item_tf .tf_g {
	width: 100%;
	height: 48px;
	border-width: 0 0 2px 0;
	border-color: #ebebeb;
	padding: 11px 70px 8px 0;
	color: #252525;
	outline: 0;
	border-radius: 0;
	box-sizing: border-box;
	caret-color: #f7e317;
	text-decoration: none
}

.item_tf .tf_g:focus {
	border-color: #262626
}

.item_tf .tf_g[type=password] {
	letter-spacing: 1px
}

.item_tf .tf_g:disabled {
	color: #adadad
}

.item_tf .tf_g[type=number] {
	-moz-appearance: textfield;
	-webkit-appearance: textfield;
	appearance: textfield
}

.item_tf .tf_g[type=number]::-webkit-inner-spin-button {
	-webkit-appearance: none;
	-moz-appearance: none
}

.item_tf .tf_type2 {
	padding-right: 110px
}

.item_tf .tf_type2::-webkit-input-placeholder {
	font-size: 16px;
	color: #ccc;
	opacity: 1
}

.item_tf .tf_type2::-moz-placeholder {
	font-size: 16px;
	color: #ccc;
	opacity: 1
}

.item_tf .tf_type2:-ms-input-placeholder {
	font-size: 16px;
	color: #ccc;
	opacity: 1
}

.item_tf .tf_type2:-moz-placeholder {
	font-size: 16px;
	color: #ccc;
	opacity: 1
}

.item_tf .tf_password {
	letter-spacing: 0
}

.item_tf .tf_noutill {
	padding-right: 0 !important
}

.item_tf .tf_send {
	padding-right: 100px
}

.item_tf .lab_placeholder {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 47px;
	line-height: 47px;
	color: #ccc
}

.item_fix {
	width: 100%;
	height: 47px;
	margin-bottom: 10px;
	line-height: 47px;
	border-bottom: 2px solid #ebebeb
}

.item_fix .txt_nation {
	color: #191919;
	padding-right: 18px
}

.type_on {
	border-color: #7c7c7c
}

.type_on .lab_placeholder {
	display: none
}

.type_on .tf_g {
	border-color: #7c7c7c
}

.type_error .tf_g {
	border-color: #e65f3e !important
}

.info_error {
	margin-top: 10px;
	color: #e65f3e;
	font-size: 13px
}

.util_tf {
	position: absolute;
	top: 10px;
	right: 0;
	min-width: 55px;
	text-align: right
}

.util_tf .btn_g {
	height: 35px;
	margin-top: -9px;
	padding: 0 17px;
	font-size: 14px;
	border-color: #ccc
}

.util_tf .btn_del .ico_del {
	display: block;
	width: 20px;
	height: 20px;
	z-index: 10;
	background-position: -120px -30px
}

.util_tf .btn_modify {
	height: 30px;
	margin-top: -3px;
	padding: 0 14px
}

.util_tf .ico_done {
	width: 23px;
	height: 20px;
	margin-right: 10px;
	background-position: -150px -30px
}

.util_tf .info_count {
	display: inline-block;
	margin-left: 15px;
	font-size: 12px;
	color: #adadad;
	line-height: 22px
}

.util_tf .info_mail {
	font-family: 'NotoSans-Bold', sans-serif;
	font-size: 16px;
	color: #666
}

.util_tf .time_count {
	color: #e65f3e
}

.tf_required {
	display: block;
	font-size: 12px;
	color: #000;
	font-weight: normal;
	margin-top: 40px
}

.tf_required .btn_help {
	margin: -3px 0 0 2px
}

.wrap_inp {
	box-sizing: border-box
}

.wrap_inp:after {
	display: block;
	height: 0;
	content: ".";
	font-size: 0;
	visibility: hidden;
	clear: both
}

.wrap_inp .item_inp {
	display: inline-block;
	padding-right: 0
}

.wrap_inp .item_radio+.item_radio {
	margin-top: 0;
	margin-left: 50px
}

.wrap_inp .tf_g {
	border-width: 0;
	height: 46px
}

.link_comm {
	display: inline-block;
	font-size: 12px;
	color: #191919;
	vertical-align: top;
	text-decoration: underline
}

.link_comm:hover {
	text-decoration: underline
}

.link_notice {
	font-size: 0;
	line-height: 0;
	color: #e65f3e;
	border-color: #e65f3e
}

.link_notice .ico_error {
	margin: 4px 0 0 0
}

.link_notice .txt_notice {
	padding-left: 4px;
	font-size: 12px;
	line-height: 22px
}

.link_change {
	display: block;
	margin-top: 20px
}

.link_change+.link_change {
	margin-top: 6px
}

.accordion_comm .link_accordion {
	position: relative;
	display: block
}

.accordion_comm .link_accordion .ico_arr {
	position: absolute;
	top: 50%;
	right: 21px;
	width: 12px;
	height: 10px;
	margin-top: -5px;
	background-position: -180px -30px
}

.accordion_comm .accordion_cont {
	display: none
}

.accordion_open .accordion_cont {
	display: block
}

.accordion_open .link_accordion .ico_arr {
	background-position: -180px -50px
}

.accordion_type1 {
	border: 1px solid #7c7c7c
}

.accordion_type1 .link_accordion {
	height: 24px;
	padding: 19px 55px 19px 21px;
	font-size: 14px;
	line-height: 1.5
}

.accordion_type1 .link_accordion .info_accounts {
	position: absolute;
	top: 19px;
	left: 21px;
	right: 55px;
	height: 24px;
	padding: 0 20px 0 30px
}

.accordion_type1 .link_accordion .thumb_service {
	position: absolute;
	top: 0;
	left: 0
}

.accordion_type1 .link_accordion .txt_accounts {
	float: left;
	max-width: 100%;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis
}

.accordion_type1 .accordion_cont {
	padding: 10px 20px;
	border-top: 1px solid #ccc
}

.accordion_type1 .ico_error {
	position: absolute;
	margin: 3px 0 0 6px
}

.accordion_type1+.accordion_type1 {
	margin-top: 12px
}

.type_error .link_accordion {
	margin: -1px;
	border: 1px solid #e65f3e
}

.btn_g {
	display: inline-block;
	height: 42px;
	padding: 0 31px;
	color: #252525;
	border: 1px solid #dbdbdb;
	border-radius: 30px;
	box-sizing: border-box
}

.btn_change {
	width: 46px;
	height: 26px;
	border: 1px solid #e0e0e0;
	font-size: 12px;
	color: #252525
}

.wrap_btn.type_fixed {
	overflow: hidden;
	position: absolute;
	right: 69px;
	bottom: 49px;
	left: 69px;
	text-align: center
}

.wrap_btn.type_fixed .btn_g {
	float: left;
	width: calc(50% - 3px)
}

.wrap_btn.type_fixed .btn_g:only-of-type {
	width: 100%
}

.wrap_btn.type_fixed .btn_g+.btn_g {
	margin: 0 0 0 6px
}

.wrap_btn .link_receive {
	margin-top: 26px
}

.wrap_btn .btn_g {
	display: block;
	width: 100%;
	height: 50px;
	padding: 0;
	border: 0;
	border-radius: 4px;
	font-size: 15px;
	color: #191919;
	background-color: #f6f6f6
}

.wrap_btn .btn_g:disabled {
	background-color: #f7f7f7;
	color: #b2b2b2;
	cursor: default
}

.wrap_btn .btn_g:hover {
	background-color: #e7e7e7
}

.wrap_btn .btn_g:active {
	background-color: #e7e7e7
}

.wrap_btn .btn_g+.btn_g {
	margin-top: 10px
}

.wrap_btn .btn_confirm {
	background-color: #fee500
}

.wrap_btn .btn_confirm:hover {
	background-color: #f0d700
}

.wrap_btn .btn_confirm:active {
	background-color: #f0d700
}

.wrap_btn .btn_confirm:disabled {
	background-color: #e7e7e7
}

.wrap_btn .btn_confirm2 {
	color: #fff;
	background-color: #ff6229
}

.wrap_btn .btn_confirm2:hover {
	background-color: #ff6229
}

.wrap_btn .btn_confirm2:active {
	background-color: #ff6229
}

.wrap_btn .ico_talk {
	width: 14px;
	height: 13px;
	margin: -3px 5px 0 0;
	background-position: -150px -280px;
	vertical-align: middle
}

.wrap_btn3 {
	overflow: hidden;
	position: absolute;
	right: 69px;
	bottom: 49px;
	left: 69px
}

.wrap_btn6 {
	margin-top: 40px;
	font-size: 0;
	text-align: center
}

.wrap_btn6 .btn_g2 {
	display: inline-block;
	width: 250px;
	font-size: 16px;
	color: #252525
}

.wrap_btn6 .btn_g2+.btn_g2 {
	margin: 0 0 0 10px
}

.type_last {
	margin-bottom: 100px
}

.wrap_tbl .tbl_g {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	border-bottom: 1px solid #ccc
}

.wrap_tbl .tbl_g th, .wrap_tbl .tbl_g td {
	padding: 11px 17px;
	border: solid #ccc;
	border-width: 1px 0 0 1px;
	letter-spacing: 0
}

.wrap_tbl .tbl_g th:first-child, .wrap_tbl .tbl_g td:first-child {
	border-left: 0 none
}

.wrap_tbl .tbl_g th {
	text-align: center;
	background-color: #fafafa
}

.wrap_tbl .tit_tbl {
	display: block;
	margin: 20px 0 11px;
	font-weight: normal
}

.wrap_tbl .desc_table {
	margin-top: 10px
}

.wrap_tbl .tbl_type1 {
	border-top: 1px solid #1e1e1e;
	border-bottom-color: #d4d4d4
}

.wrap_tbl .tbl_type1 th {
	padding: 10px;
	color: #252525;
	font-weight: normal;
	border: 0 none;
	border-width: 1px 0 0 0;
	letter-spacing: 0
}

.wrap_tbl .tbl_type1 td {
	padding: 11px 10px 12px;
	color: #252525;
	font-size: 14px;
	border: solid #d4d4d4;
	border-width: 1px 0 0 0;
	letter-spacing: 0;
	vertical-align: top
}

.wrap_tbl .tbl_type1 .link_view {
	position: relative;
	display: block;
	padding-right: 10px;
	color: #252525
}

.wrap_tbl .tbl_type1 .link_view .ico_arr {
	position: absolute;
	top: 0;
	right: 0;
	width: 10px;
	height: 15px;
	margin-top: 3px;
	background-position: 0 -80px;
	vertical-align: top
}

.wrap_tbl .tbl_type2 {
	border-top: 1px solid #1e1e1e;
	border-bottom: 1px solid #d4d4d4
}

.wrap_signout {
	padding-bottom: 40px;
	border-bottom: 1px solid #e5e5e5
}

.dimmed_layer {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #000;
	opacity: .4;
	filter: alpha(opacity = 40);
	z-index: 998
}

.kakao_layer {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 40px;
	text-align: center;
	font-size: 0;
	z-index: 999
}

.kakao_layer .inner_kakao_layer {
	position: relative;
	display: inline-block;
	width: 100%;
	max-width: 380px;
	padding: 45px 30px 30px;
	vertical-align: middle;
	font-size: 15px;
	text-align: left;
	border-radius: 3px;
	background-color: #fff;
	word-break: keep-all;
	box-sizing: border-box
}

.kakao_layer .layer_head .tit_layer {
	display: block;
	font-size: 18px;
	color: #404040;
	line-height: 26px;
	letter-spacing: -1px;
	word-break: keep-all;
	font-weight: normal
}

.kakao_layer .layer_body {
	word-break: keep-all
}

.kakao_layer .layer_body .tit_mail {
	display: block;
	font-size: 18px;
	line-height: 27px;
	font-family: 'NotoSans-Bold', sans-serif;
	color: #191919
}

.kakao_layer .layer_body .txt_confirm {
	display: block;
	margin-top: 4px;
	font-size: 14px;
	line-height: 21px;
	color: #7f7f7f
}

.kakao_layer .layer_body .emph_confirm {
	display: block;
	margin: 21px 0 4px;
	font-size: 14px;
	line-height: 21px;
	color: rgba(0, 0, 0, 0.85)
}

.kakao_layer .layer_body .emph_confirm+.txt_layer {
	margin-top: 0
}

.kakao_layer .layer_body .txt_layer {
	margin-top: 15px;
	font-size: 14px;
	line-height: 22px;
	color: #7c7c7c;
	letter-spacing: -1px
}

.kakao_layer .layer_body .list_desc {
	color: #7c7c7c
}

.kakao_layer .layer_body .list_layer {
	margin-top: 10px;
	font-size: 14px;
	line-height: 16px
}

.kakao_layer .layer_body .link_help {
	color: rgba(0, 0, 0, 0.85)
}

.kakao_layer .layer_body .emph_layer {
	font-family: NotoSans-Bold, sans-serif
}

.kakao_layer .fld_g .wrap_inp {
	margin: 5px 0 -14px
}

.kakao_layer .fld_agree {
	margin-top: 20px
}

.kakao_layer .fld_agree .item_check:first-of-type {
	margin-top: 0
}

.kakao_layer .agree_all {
	padding: 21px 0 26px;
	border-top: 1px solid #dfdfdf;
	border-bottom: 1px solid #dfdfdf
}

.kakao_layer .wrap_btn {
	margin-top: 30px
}

.kakao_layer .wrap_btn .btn_g {
	font-size: 15px;
	height: 50px;
	color: #252525;
	outline: 0
}

.kakao_layer .wrap_btn2 .btn_g {
	float: left;
	width: 155px;
	height: 50px;
	margin-top: 0;
	outline: 0
}

.kakao_layer .wrap_btn2 .btn_g+.btn_g {
	margin-left: 10px
}

.kakao_layer .wrap_btn2:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.kakao_layer .layer_foot {
	position: absolute;
	top: 0;
	right: 0
}

.kakao_layer .btn_close {
	padding: 15px;
	font-size: 0
}

.kakao_layer .btn_close .ico_close {
	width: 18px;
	height: 18px;
	background-position: -70px -60px
}

.kakao_layer a {
	color: #7c7c7c;
	text-decoration: underline
}

.kakao_layer .link_selected {
	text-decoration: none
}

.kakao_layer .link_login {
	display: inline-block;
	margin-top: 10px;
	font-size: 14px;
	color: #7c7c7c
}

.kakao_layer:after {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: ''
}

.kakao_layer .wrap_terms .desc_layer {
	font-size: 12px;
	color: #4a4a4a
}

.kakao_layer .wrap_terms .tit_terms {
	display: block;
	font-weight: normal;
	color: #404040;
	font-size: 16px
}

.kakao_layer .wrap_terms .tit_desc {
	margin-top: 15px;
	font-weight: bold;
	font-size: 14px;
	color: #404040
}

.kakao_layer .wrap_terms .txt_terms {
	font-size: 12px;
	color: #7c7c7c
}

.kakao_layer .wrap_terms .desc_terms {
	margin-top: 20px;
	font-size: 12px;
	color: #7c7c7c
}

.kakao_layer .wrap_terms .desc_terms+.tit_terms {
	margin-top: 40px
}

.kakao_layer .wrap_terms h3 {
	margin-top: 50px;
	font-size: 18px;
	color: #404040
}

.kakao_layer .wrap_terms h3:first-child {
	margin-top: 0
}

.kakao_layer .wrap_tbl .tit_tbl {
	margin: 21px 0 10px;
	font-size: 12px;
	color: #606060
}

.kakao_layer .wrap_tbl .tbl_g th {
	font-size: 12px;
	color: #606060
}

.kakao_layer .wrap_tbl .tbl_g td {
	padding: 10px;
	text-align: left;
	vertical-align: top;
	font-size: 12px;
	color: #606060;
	vertical-align: top;
	text-align: left;
	word-spacing: -1px
}

.kakao_layer .wrap_tbl .desc_table {
	font-size: 12px;
	color: #606060
}

.kakao_layer .lab_check .txt_emph {
	font-family: NotoSans-Bold, sans-serif;
	font-size: 17px
}

.kakao_layer .inner_terms_layer {
	overflow: hidden;
	max-width: 600px;
	max-height: 850px;
	height: 100%;
	padding-top: 100px;
	padding-bottom: 45px;
	z-index: 10
}

.kakao_layer .inner_terms_layer .layer_head {
	margin-top: -55px;
	padding: 0 0 29px 0
}

.kakao_layer .inner_terms_layer .tit_layer {
	font-size: 24px
}

.kakao_layer .inner_terms_layer .layer_body {
	overflow-x: hidden;
	overflow-y: auto;
	max-height: 100%;
	-webkit-overflow-scrolling: touch
}

.kakao_layer .inner_terms_layer .tit_terms {
	margin-top: 50px;
	font-size: 18px
}

.kakao_layer .inner_terms_layer .tit_terms:first-child {
	margin-top: 0
}

.kakao_layer .inner_terms_layer .txt_terms {
	margin: 15px 0 0
}

.kakao_layer .inner_terms_layer .wrap_tbl {
	margin-top: 15px
}

.kakao_layer .inner_terms_layer .tbl_g {
	table-layout: auto
}

.kakao_layer .inner_terms_layer .tbl_g th {
	height: 50px
}

.kakao_layer .inner_terms_layer .tbl_g td {
	padding: 15px 10px;
	text-align: center
}

.kakao_layer .inner_terms_layer2 .tit_terms {
	margin-top: 15px
}

.kakao_layer .inner_terms_layer2 .txt_terms {
	margin-top: 6px;
	font-size: 14px
}

.kakao_layer .inner_terms_layer3 {
	overflow: hidden;
	max-width: 520px;
	padding: 108px 40px 40px;
	z-index: 10
}

.kakao_layer .inner_terms_layer3 .layer_head {
	margin-top: -64px;
	padding-bottom: 38px
}

.kakao_layer .inner_terms_layer3 .tit_layer {
	font-size: 24px
}

.kakao_layer .inner_terms_layer3 .layer_body {
	overflow-x: hidden;
	overflow-y: auto;
	max-height: 100%;
	-webkit-overflow-scrolling: touch
}

.kakao_layer .inner_terms_layer3 .wrap_tbl {
	margin-top: 22px
}

.kakao_layer .inner_terms_layer3 .tbl_g td {
	padding: 22px 12px;
	vertical-align: middle;
	text-align: center
}

.kakao_layer .inner_terms_layer3 .txt_terms {
	margin: 20px 0 0
}

.kakao_layer .inner_terms_layer3 .wrap_btn .btn_g {
	max-width: 320px;
	margin: 0 auto
}

.kakao_layer .inner_terms_layer4 {
	overflow: hidden;
	max-width: 420px;
	max-height: 506px;
	height: 100%;
	padding-top: 85px;
	padding-bottom: 120px;
	z-index: 10
}

.kakao_layer .inner_terms_layer4 .layer_head {
	margin-top: -41px;
	padding-bottom: 15px
}

.kakao_layer .inner_terms_layer4 .layer_body {
	overflow-x: hidden;
	overflow-y: auto;
	max-height: 100%;
	-webkit-overflow-scrolling: touch
}

.kakao_layer .inner_terms_layer4 .tit_desc:first-child {
	margin-top: 0
}

.kakao_layer .inner_terms_layer4 .txt_terms {
	margin: 6px 0 0;
	font-size: 14px
}

.kakao_layer .inner_delete_layer {
	overflow: hidden;
	max-width: 800px;
	max-height: 624px;
	height: 100%;
	padding: 40px 0;
	border-radius: 2px;
	z-index: 10
}

.kakao_layer .inner_delete_layer .layer_head {
	padding: 0 0 12px 40px
}

.kakao_layer .inner_delete_layer .tit_layer {
	font-size: 20px
}

.kakao_layer .inner_delete_layer .layer_body .desc_layer {
	padding: 0 40px;
	font-size: 12px;
	color: #4a4a4a
}

.kakao_layer .inner_delete_layer .layer_body .wrap_tbl {
	-webkit-overflow-scrolling: touch;
	overflow-x: hidden;
	overflow-y: auto;
	height: 355px;
	max-height: 100%;
	margin-top: 30px;
	padding: 0 40px
}

.kakao_layer .inner_delete_layer .tbl_g {
	width: 720px
}

.kakao_layer .inner_delete_layer .tbl_g .emph_g {
	display: block;
	color: #e65f3e
}

.kakao_layer .inner_delete_layer .wrap_btn .btn_g {
	max-width: 270px;
	margin: 0 auto
}

.kakao_layer .inner_privacy_layer {
	max-width: 800px;
	padding: 40px 40px 50px
}

.kakao_layer .inner_privacy_layer .layer_head .tit_layer {
	font-size: 20px;
	line-height: 29px;
	color: #404040
}

.kakao_layer .inner_privacy_layer .desc_layer {
	margin-top: 10px;
	font-size: 12px;
	line-height: 16px;
	color: #4a4a4a
}

.kakao_layer .inner_privacy_layer .link_privacy {
	font-family: NotoSans-Bold, sans-serif
}

.kakao_layer .inner_privacy_layer .wrap_btn .btn_g {
	max-width: 270px;
	margin: 0 auto
}

.kakao_layer .inner_privacy_layer2 {
	max-width: 600px
}

.kakao_layer .inner_privacy_layer2 .layer_head .tit_layer {
	font-size: 20px
}

.kakao_layer .inner_privacy_layer2 .desc_layer {
	margin-top: 10px;
	line-height: 16px
}

.kakao_layer .inner_privacy_layer2 .wrap_terms {
	margin-top: 10px
}

.kakao_layer .inner_privacy_layer2 .wrap_terms .desc_layer {
	margin-top: 0;
	padding-top: 10px;
	border-top: 1px solid #ccc
}

.kakao_layer .inner_privacy_layer2 .wrap_terms .tit_terms {
	margin: 30px 0 10px
}

.kakao_layer .inner_privacy_layer2 .wrap_iframe iframe {
	width: 100%;
	min-height: 459px;
	border: 0 none;
	vertical-align: top
}

.kakao_layer .inner_privacy_layer2 .wrap_btn .btn_g {
	max-width: 270px;
	margin: 0 auto
}

.kakao_layer .inner_select_layer {
	max-width: 320px
}

.kakao_layer .inner_select_layer .list_select {
	margin-top: 30px;
	text-align: center
}

.kakao_layer .inner_select_layer .list_select li {
	height: 50px;
	margin-top: 5px;
	line-height: 50px;
	border: 1px solid rgba(25, 25, 25, 0.14);
	border-radius: 4px
}

.kakao_layer .inner_select_layer .list_select .link_select {
	display: block;
	text-decoration: none
}

.kakao_layer .inner_select_layer .wrap_btn {
	margin-top: 20px
}

.kakao_layer .inner_agree_layer {
	max-width: 350px
}

.kakao_layer .inner_alert_layer {
	max-width: 430px
}

.kakao_layer .inner_alert_layer .tit_layer {
	font-size: 18px;
	line-height: 27px;
	color: #1e1e1e;
	letter-spacing: 0
}

.agree_comm {
	position: relative
}

.agree_comm+.agree_comm {
	margin-top: 20px
}

.agree_comm+.wrap_btn {
	margin-top: 30px
}

.agree_comm .item_check {
	margin-top: 0;
	padding-right: 30px
}

.agree_comm .link_more {
	position: absolute;
	top: 0;
	right: 0;
	font-size: 0
}

.agree_comm .link_more .ico_arr {
	width: 8px;
	height: 13px;
	margin: 5px 4px 4px 8px;
	background-position: -190px -100px
}

.agree_comm .desc_check {
	padding: 5px 40px 0 28px
}

.agree_all .lab_check .txt_check {
	font-family: NotoSans-Bold, sans-serif;
	font-size: 17px;
	color: #333
}

.ul_agree {
	margin-top: 15px;
	padding-left: 30px;
	font-size: 12px;
	color: #7c7c7c
}

.ul_agree li {
	list-style-type: disc
}

.list_num {
	margin-top: 20px;
	padding-left: 15px;
	font-size: 14px;
	word-break: break-all
}

.list_num li {
	margin-top: 11px;
	list-style-type: decimal
}

.cont_mail #mArticle {
	min-height: 410px
}

.cont_mail .info_desc {
	margin-top: -28px;
	font-size: 16px;
	line-height: 24px;
	color: #767676;
	letter-spacing: -0.045em
}

.cont_mail .area_img {
	max-width: 290px;
	margin: 24px auto 30px;
	text-align: center
}

.cont_mail .area_img .img_integrate {
	max-width: 100%;
	vertical-align: top
}

.cont_mail .box_check {
	margin: 28px 0 40px
}

.cont_mail .info_email {
	margin-top: -14px
}

.cont_mail .util_tf .info_mail {
	font-family: 'NotoSans-Medium', sans-serif;
	letter-spacing: 0
}

.cont_mail .list_desc {
	margin-top: 20px
}

.cont_mail .list_desc li {
	margin-top: 8px
}

.info_tip {
	padding: 10px 0 16px;
	font-size: 12px;
	line-height: 18px;
	color: rgba(0, 0, 0, 0.6);
	text-align: left
}

.info_tip .txt_tip {
	font-family: 'NotoSans-Bold', sans-serif;
	color: #e65f32
}

.login_type2 .info_tip {
	color: #fff
}

.login_type2 .info_tip .txt_tip {
	color: #fff
}

.login_type2 .login_kakaomail .box_error {
	background: rgba(0, 0, 0, 0.7);
	color: #fff
}

.login_type2 .login_kakaomail .email_done .info_mail {
	color: #fff;
	color: rgba(255, 255, 255, 0.5)
}

.login_type2 .login_kakaotalk .info_user .list_user .link_user {
	color: #fff
}

.login_type2 .login_kakaotalk .box_error {
	color: #fff;
	background-color: rgba(0, 0, 0, 0.7)
}

.login_kakaomail .util_tf {
	top: 12px
}

.login_kakaomail .bg_login img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	min-width: 100%;
	min-height: 100%
}

.login_kakaomail .box_error {
	margin-top: 40px;
	padding: 20px;
	font-size: 13px;
	line-height: 20px;
	color: #e65f3e;
	background: #fafafa;
	letter-spacing: -0.05em;
	word-wrap: break-word;
	word-break: keep-all
}

.login_kakaomail .email_done .info_mail {
	display: inline-block;
	margin-top: 2px;
	font-size: 15px;
	line-height: 24px;
	color: #7f7f7f;
	font-family: 'NotoSans-Medium', sans-serif
}

.login_kakaomail .txt_moreinfo {
	display: none
}

.login_type5 {
	background: #fff
}

.login_type5.account_comm #kakaoWrap {
	display: block;
	height: 100%;
	padding: 0
}

.login_type5.login_type2 .login_kakaotalk.login_fail .box_login {
	background-color: rgba(0, 0, 0, 0.2)
}

.login_type5.login_type2 .login_kakaotalk .info_login .tit_txt {
	color: rgba(255, 255, 255, 0.85)
}

.login_type5.login_type2 .login_kakaotalk .list_login li {
	color: rgba(255, 255, 255, 0.8)
}

.login_type5.login_type2 .login_kakaotalk .list_login li:before {
	background-color: rgba(255, 255, 255, 0.8)
}

.login_type5.login_type2 .login_kakaotalk .box_login, .login_type5.login_type2 .login_kakaotalk .area_login
	{
	background-color: rgba(0, 0, 0, 0.25)
}

.login_type5.login_type2 .login_kakaotalk .intro_talk .txt_info {
	color: #fff
}

.login_type5.login_type2 .login_kakaotalk .info_desc {
	color: #fff
}

.login_type5.login_type2 .login_kakaotalk .util_tf .btn_del .ico_del {
	background-position: -170px -270px
}

.login_type5.login_type2 .login_kakaotalk .wrap_btn .btn_g {
	background-color: #f6f6f6
}

.login_type5.login_type2 .login_kakaotalk .wrap_btn .btn_g.btn_confirm {
	background-color: #fee500
}

.login_type5.login_type2 .login_kakaotalk .item_tf .tf_g {
	border-color: #fff;
	border-color: rgba(255, 255, 255, 0.5);
	-webkit-background-clip: padding-box;
	background-clip: padding-box
}

.login_type5.login_type2 .login_kakaotalk .item_tf .tf_g:focus {
	border-color: #fff
}

.login_type5.login_type2 .tit_intro {
	display: none
}

.login_type5.login_type2 #kakaoServiceLogo.logo_kakao .img_logo {
	height: 30px
}

.login_type5.login_type2 #kakaoHead {
	position: relative;
	top: auto;
	left: auto;
	padding: 50px 20px 0;
	background: rgba(0, 0, 0, 0.2);
	text-align: center
}

.login_type5.login_type2 #kakaoFoot {
	border-top: 1px solid white;
	border-top: 1px solid rgba(255, 255, 255, 0.3);
	-webkit-background-clip: padding-box;
	background-clip: padding-box
}

.login_type5.login_type2 #kakaoFoot .service_info {
	border-top: 0 none
}

.login_type5.login_type2 .intro_talk {
	background: rgba(0, 0, 0, 0.2)
}

.login_type5.login_type2 .footer_comm .item_select .link_selected {
	color: #fff
}

.login_type5.login_type2 .footer_comm .link_kakao {
	color: #fff
}

.login_type5.login_type2 .info_user .list_user li:before {
	background-color: rgba(255, 255, 255, 0.2)
}

.login_type5 .login_content_wrap {
	height: calc(100% - 80px)
}

.login_type5 #kakaoContent {
	height: 100%
}

.login_type5 #cMain, .login_type5 #mArticle {
	height: 100%
}

.login_type5 #kakaoHead {
	max-width: 580px;
	padding-top: 50px
}

.login_type5 .cont_login #mArticle {
	max-width: 100%;
	min-height: auto;
	margin: 0;
	padding: 0;
	border: 0 none
}

.login_type5 .login_kakaotalk {
	display: flex;
	flex-direction: column;
	min-height: 100%;
	padding: 0
}

.login_type5 .login_kakaotalk .wrap_btn {
	margin-top: 30px
}

.login_type5 .footer_comm {
	display: none
}

.login_type5 .footer_comm .service_info {
	padding: 10px 0 0
}

.login_type5 .footer_comm .link_info {
	padding: 0 5px;
	color: #7f7f7f
}

.login_type5 .footer_comm .item_select {
	padding: 0 5px
}

.login_type5 .footer_comm .item_select .link_selected {
	color: #7f7f7f
}

.login_type5 .footer_comm .link_kakao {
	color: #7c7c7c
}

.login_kakaotalk .util_tf {
	top: 7px
}

.login_kakaotalk .util_tf .btn_del {
	padding: 5px;
	margin-right: -5px
}

.login_kakaotalk .util_tf .btn_del .ico_del {
	width: 16px;
	height: 16px;
	background-position: -170px -250px
}

.login_kakaotalk .type_phone {
	height: 42px
}

.login_kakaotalk .type_phone .link_selected {
	height: 42px;
	line-height: 41px
}

.login_kakaotalk .type_phone .phone_tf:before {
	height: 20px
}

.login_kakaotalk .type_phone .phone_tf .tf_g {
	border-bottom: 0 none
}

.login_kakaotalk .type_phone .phone_tf .util_tf {
	top: 10px
}

.login_kakaotalk .item_tf .tf_g {
	height: 42px;
	padding: 6px 70px 9px 0;
	border-bottom-width: 1px;
	border-color: #d7d7d7;
	font-size: 15px;
	background: transparent
}

.login_kakaotalk .item_tf .tf_g:focus {
	border-color: #252525
}

.login_kakaotalk .item_tf .lab_placeholder {
	height: 42px;
	line-height: 40px
}

.login_kakaotalk .wrap_btn .btn_g {
	background-color: rgba(0, 0, 0, 0.04)
}

.login_kakaotalk .wrap_btn .btn_confirm {
	background-color: #fee500
}

.login_kakaotalk.login_fail .intro_talk {
	padding-bottom: 0
}

.login_kakaotalk.login_fail .box_login {
	padding: 30px 20px 50px;
	background-color: #fff
}

.login_kakaotalk.login_fail .info_desc {
	display: none
}

.login_kakaotalk .intro_talk {
	padding: 28px 20px 50px
}

.login_kakaotalk .intro_talk .txt_info {
	padding-bottom: 5px;
	font-size: 15px;
	line-height: 22px;
	color: #262626;
	text-align: center
}

.login_kakaotalk .intro_talk .txt_info2 {
	padding-bottom: 0;
	font-size: 14px;
	line-height: 21px
}

.login_kakaotalk .info_desc {
	display: block;
	padding-bottom: 30px;
	font-weight: normal;
	font-size: 15px;
	line-height: 18px;
	color: #252525;
	text-align: center
}

.login_kakaotalk .box_error {
	margin-top: 30px;
	padding: 20px;
	font-size: 13px;
	line-height: 17px;
	color: #e65f3e;
	background: rgba(0, 0, 0, 0.04);
	letter-spacing: -0.05em;
	word-wrap: break-word;
	word-break: keep-all
}

.login_kakaotalk .box_login {
	padding: 45px 20px 80px;
	background-color: #fafafa
}

.login_kakaotalk .box_login .set_login {
	margin-top: 20px
}

.login_kakaotalk .box_login .set_login .txt_check {
	font-size: 13px
}

.login_kakaotalk .box_login .box_desc {
	background-color: rgba(0, 0, 0, 0.04)
}

.login_kakaotalk .bg_login img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	min-width: 100%;
	min-height: 100%
}

.login_kakaotalk .box_login .open_captcha {
	margin-top: 30px
}

.login_kakaotalk .box_login .open_captcha ~ .box_error {
	margin-top: 10px
}

.login_kakaotalk .box_login .info_user {
	margin-top: 18px
}

.login_kakaotalk .info_user .list_user {
	float: none;
	font-size: 0;
	text-align: center
}

.login_kakaotalk .info_user .list_user li {
	display: inline-block;
	float: none;
	vertical-align: top
}

.login_kakaotalk .info_user .list_user li:before {
	margin: 4px 15px;
	background-color: rgba(0, 0, 0, 0.08)
}

.login_kakaotalk .info_user .list_user .link_user {
	color: #7d7d7d
}

.login_kakaotalk .area_login {
	display: block;
	display: flex;
	flex-direction: column;
	flex: 1;
	background: #fafafa
}

.login_kakaotalk .area_login #kakaoFoot {
	display: block;
	position: static;
	width: 100%;
	margin-top: auto;
	padding: 0 10px 15px;
	border-top: 1px solid #d8d8d8;
	box-sizing: border-box
}

.login_kakaotalk .info_login {
	padding: 21px 20px 80px
}

.login_kakaotalk .info_login .tit_txt {
	display: block;
	font-weight: normal;
	font-size: 13px;
	line-height: 16px;
	color: #252525
}

.login_kakaotalk .list_login {
	padding-top: 14px
}

.login_kakaotalk .list_login li {
	position: relative;
	padding-left: 7px;
	font-size: 11px;
	line-height: 13px;
	color: #7d7d7d;
	letter-spacing: -0.028em
}

.login_kakaotalk .list_login li+li {
	margin-top: 8px
}

.login_kakaotalk .list_login li:before {
	position: absolute;
	top: 6px;
	left: 0;
	width: 2px;
	height: 2px;
	border-radius: 50%;
	background: #7d7d7d;
	content: ''
}

.cont_login .box_counsel .box_qrcode {
	height: auto;
	border: 0;
	margin: 0;
	box-sizing: inherit
}

#kakaoServiceLogo {
	display: inline-block;
	width: 88px;
	height: 27px;
	margin: 0 auto;
	line-height: 1;
	vertical-align: top;
	background:
		url("/assets/weblogin/techin/ico_account-4038b4e6064e4e8399ed0cf002a5b2f4262aed369aeab218e019ead3689755f4.png")
}

#kakaoServiceLogo.logo_kakao {
	width: auto;
	height: auto;
	line-height: 0;
	background: 0
}

#kakaoServiceLogo.logo_kakao .img_logo {
	vertical-align: top
}

.tit_page {
	display: block;
	padding-top: 20px;
	color: #252525;
	font-size: 28px;
	font-weight: normal;
	text-align: center
}

.tit_page2 {
	font-size: 24px
}

.tit_page3 {
	padding: 0;
	font-size: 24px
}

.tit_main {
	font-size: 24px;
	line-height: 34px;
	color: #252525;
	letter-spacing: -1px;
	font-weight: normal
}

.desc_page {
	margin-top: 15px;
	text-align: center
}

.desc_page2 {
	margin-top: 30px
}

.desc_main {
	margin-top: 15px;
	text-align: left;
	word-break: keep-all
}

.desc_main .btn_help {
	margin: -3px 0 0 2px
}

.desc_main .link_change {
	margin-top: 8px;
	color: rgba(0, 0, 0, 0.4)
}

.desc_agreement {
	margin-top: -42px;
	font-size: 14px;
	text-align: center
}

.desc_tip {
	margin-top: 8px;
	font-size: 11px;
	line-height: 18px;
	text-align: center;
	color: #252525
}

.desc_tip .ico_tip {
	margin-right: 10px
}

.desc_tip .ico_tip2 {
	margin-right: 6px
}

.emph_page {
	color: #252525
}

.tit_step {
	margin-bottom: 44px;
	font-size: 24px;
	line-height: 34px;
	color: #252525;
	font-weight: normal
}

.box_intro {
	margin-top: 80px
}

.box_intro .txt_intro {
	color: #7c7c7c;
	font-size: 14px;
	line-height: 22px;
	text-align: center
}

.box_intro .txt_intro .link_g {
	display: block;
	margin: 10px auto 0
}

.box_intro .wrap_btn {
	margin: 15px 0 60px
}

.box_intro .wrap_btn2 {
	margin: -30px 0 0
}

.box_guide {
	margin-top: 40px
}

.box_guide .wrap_btn {
	margin: 50px 0 30px
}

.fld_agree {
	margin-top: -16px
}

.fld_agree .item_check {
	padding-right: 40px
}

.fld_agree .desc_check {
	padding: 5px 40px 0 28px
}

.fld_agree .desc_check2 {
	padding: 6px 2px 20px 28px
}

.fld_agree .desc_check3 {
	padding-left: 22px
}

.fld_agree .desc_check3 .link_terms {
	margin-left: 6px
}

.fld_agree .desc_checkall {
	padding: 10px 40px 20px 28px;
	border-bottom: 1px solid #e5e5e5
}

.fld_agree .txt_elective {
	color: #7c7c7c
}

.fld_agree .link_terms {
	display: inline-block;
	text-decoration: underline;
	color: #959595
}

.fld_apply {
	margin-top: -28px
}

.fld_apply .tf_email {
	font-family: NotoSans-Bold, sans-serif;
	font-size: 18px
}

.fld_apply .error_email {
	float: left;
	margin-top: -4px
}

.fld_apply .wrap_btn2 {
	overflow: hidden;
	margin: 15px 0 40px
}

.fld_apply .wrap_btn2 .link_verify {
	float: left;
	font-size: 13px;
	color: #191919
}

.fld_apply .wrap_btn2 .btn_g {
	float: right
}

.fld_apply .wrap_btn2 .link_comm {
	vertical-align: middle
}

.fld_apply .wrap_btn2 .btn_send {
	width: 64px;
	height: 26px;
	padding: 0;
	font-size: 12px
}

.fld_apply .list_desc {
	margin-top: 22px
}

.type_birth {
	height: 48px;
	border-bottom: 2px solid #ebebeb
}

.type_birth .item_select .list_select {
	min-width: 90px
}

.type_birth .item_select .link_select {
	white-space: nowrap
}

.type_birth .select_year {
	width: 122px
}

.type_birth .select_month {
	width: 103px
}

.type_birth .check_lunar {
	float: right;
	margin-top: 10px
}

.type_birth .wrap_check {
	margin-top: 10px
}

.type_email .item_select .list_select {
	width: 260px
}

.type_resident {
	position: relative;
	overflow: hidden;
	height: 48px;
	margin: 12px 0 0
}

.type_resident:after {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 20px;
	height: 2px;
	margin-left: -10px;
	margin-top: -4px;
	background-color: rgba(0, 0, 0, 0.3);
	visibility: visible
}

.type_resident .item_tf {
	float: left;
	width: calc(50% - 20px)
}

.type_resident .item_tf+.item_tf {
	margin: 0 0 0 40px
}

.type_resident .item_tf+.item_tf .tf_g {
	width: 34px;
	text-align: center
}

.type_resident .tf_g {
	padding-right: 0;
	border-width: 0 0 2px 0
}

.type_resident .box_dot {
	display: inline-block;
	font-size: 0;
	line-height: 0
}

.type_resident .box_dot .ico_dot {
	display: inline-block;
	width: 8px;
	height: 8px;
	margin-left: 12px;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.16)
}

.type_resident .box_dot .ico_dot:first-child {
	margin-left: 8px
}

.type_telecom {
	overflow: hidden;
	position: relative;
	height: 48px;
	margin: 8px 0 0;
	border-bottom: 2px solid #ebebeb
}

.type_telecom .item_select {
	float: left;
	width: 115px
}

.type_telecom .item_select+.item_tf {
	float: left;
	margin-left: 15px;
	width: calc(100% - 130px)
}

.type_telecom.type_on {
	border-color: #7c7c7c
}

.type_telecom.type_error {
	border-color: #e65f3e !important
}

.type_telecom+.item_tf {
	margin: 8px 0 25px
}

.type_phone {
	position: relative;
	height: 48px;
	padding-left: 85px;
	border-bottom: 2px solid #ebebeb
}

.type_phone .link_selected .ico_arr {
	position: absolute;
	right: 16px
}

.type_phone .item_select {
	position: absolute;
	top: 0;
	left: 0;
	width: 85px
}

.type_phone .item_select .list_select {
	width: 260px;
	max-height: 438px
}

.type_phone .item_select .list_select .num_select {
	display: inline-block;
	min-width: 35px
}

.type_phone .phone_tf {
	display: block
}

.type_phone .list_select {
	max-height: 244px
}

.type_phone+.item_tf {
	margin-top: 10px
}

.type_phone .item_tf:before {
	content: '';
	position: absolute;
	top: 12px;
	left: 0;
	width: 1px;
	height: 22px;
	background-color: #e2e2e2
}

.type_phone .item_tf .lab_placeholder {
	padding-left: 15px;
	box-sizing: border-box
}

.type_phone .item_tf .tf_g {
	padding-left: 15px
}

.type_phone.type_on {
	border-color: #7c7c7c
}

.type_phone.type_error {
	border-color: #e65f3e !important
}

.type_newmail .tf_g {
	padding-right: 100px
}

.type_newmail .txt_mail {
	color: #7c7c7c;
	font-family: NotoSans-Bold, sans-serif
}

.type_phone2 {
	margin-left: -25px
}

.type_phone2 .item_tf {
	float: left;
	box-sizing: border-box;
	width: 33.33%;
	margin-top: 0;
	padding-left: 25px
}

.type_phone2 .item_tf+.item_tf:before {
	content: '';
	display: block;
	position: absolute;
	top: 20px;
	left: 8px;
	width: 9px;
	height: 1px;
	background-color: #ccc
}

.type_phone2 .item_tf .lab_placeholder {
	left: 25px;
	right: 0;
	width: auto;
	height: 24px;
	padding: 8px 0 14px;
	line-height: 24px
}

.type_phone2 .item_tf .tf_g {
	height: auto;
	padding: 8px 0 14px;
	border-bottom-width: 2px;
	font-size: 15px;
	line-height: 24px;
	letter-spacing: 0
}

.type_time .item_select {
	position: relative;
	border-bottom: 2px solid #ebebeb
}

.type_time .item_select .link_selected {
	overflow: hidden
}

.type_time .item_select .ico_arr {
	float: right
}

.type_time .item_select .list_select {
	width: 100%
}

.type_gender {
	overflow: hidden;
	width: 100%;
	border-bottom: 2px solid #ebebeb
}

.type_gender .item_inp {
	float: left;
	width: calc(50% - 41px)
}

.type_gender .item_inp+.item_inp {
	margin-left: 0
}

.type_gender .item_inp:last-child {
	width: 82px
}

.type_gender.on {
	border-color: #7c7c7c
}

.type_gender:after {
	display: none
}

.box_joined {
	margin-top: -4px;
	text-align: center
}

.box_joined .info_joined {
	padding: 35px 30px 32px;
	font-size: 14px;
	color: #4a4a4a;
	background-color: #fafafa
}

.box_joined .info_joined .item_info {
	overflow: hidden;
	margin-top: 10px;
	text-align: left
}

.box_joined .info_joined .item_info dt {
	float: left;
	min-width: 77px;
	margin-right: 10px;
	line-height: 22px;
	color: #7c7c7c
}

.box_joined .info_joined .item_info dd {
	overflow: hidden;
	font-size: 16px;
	font-weight: 500;
	color: #252525;
	line-height: 22px;
	word-wrap: break-word
}

.box_joined .info_joined .item_info:first-child {
	margin-top: 0
}

.box_joined .info_joined .tit_joined {
	display: block;
	margin-bottom: 8px;
	font-weight: 500;
	font-size: 18px;
	line-height: 24px
}

.box_joined .wrap_btn {
	margin: 15px 0 60px
}

.thumb_profile {
	position: relative
}

.thumb_profile .img_profile {
	display: block;
	width: 100%;
	height: 100%
}

.thumb_profile .img_frame {
	position: absolute;
	top: -1px;
	bottom: -1px;
	left: -1px;
	right: -1px;
	background:
		url("/assets/weblogin/techin/mask_bg-7651fa4775a06797103b2a82404d5a0061dc6176a23bec1444afc7aa8c9a93fe.png")
		0 0 no-repeat;
	background-size: 100% 100%
}

.info_account {
	position: relative;
	margin: 52px 0 55px;
	text-align: center;
	color: #252525
}

.info_account .thumb_profile {
	width: 66px;
	height: 66px;
	margin: 0 auto
}

.info_account .btn_photo {
	position: absolute;
	top: 32px;
	left: 50%;
	margin-left: 15px;
	z-index: 10
}

.info_account .btn_photo .ico_photo {
	width: 34px;
	height: 34px;
	background-position: -30px -60px
}

.info_account .btn_g {
	height: 35px;
	margin-top: 20px;
	padding: 0 16px;
	line-height: 33px;
	font-size: 14px
}

.info_profile {
	margin-top: 6px
}

.info_profile .tit_profile {
	display: block;
	font-family: NotoSans-Bold, sans-serif;
	font-size: 18px;
	line-height: 28px
}

.info_profile .txt_profile {
	display: block;
	margin-top: 2px;
	font-size: 14px;
	line-height: 24px
}

.footer_comm .service_info {
	font-size: 0
}

.footer_comm .item_select {
	display: inline-block;
	min-width: 53px;
	padding: 0 10px;
	text-align: left
}

.footer_comm .item_select .link_selected {
	height: auto;
	line-height: 20px;
	font-size: 12px
}

.footer_comm .item_select .link_selected .ico_arr {
	width: 9px;
	height: 6px;
	margin: 7px 0 0 4px;
	background-position: 0 -60px
}

.footer_comm .item_select .list_select {
	top: auto;
	bottom: -12px;
	min-width: 90px
}

.footer_comm .link_info {
	display: inline-block;
	padding: 0 10px;
	font-size: 12px;
	color: #4c4c4c;
	line-height: 20px
}

.footer_comm .link_policy {
	font-family: NotoSans-Bold, sans-serif
}

.footer_comm .txt_copyright {
	display: block;
	margin-top: 8px;
	font-size: 11px;
	color: #7c7c7c;
	line-height: 18px;
	letter-spacing: 0
}

.footer_comm .link_kakao {
	font-family: NotoSans-Bold, sans-serif
}

.ico_daum {
	width: 20px;
	height: 24px;
	background-position: -90px -60px
}

.ico_melon {
	width: 20px;
	height: 24px;
	background-position: -110px -60px
}

.ico_error {
	width: 15px;
	height: 15px;
	background-position: -150px -60px
}

.wrap_notice {
	font-size: 14px
}

.tit_notice {
	color: #4c4c4c
}

.ico_notice {
	float: left;
	width: 15px;
	height: 15px;
	margin: 4px 6px 0 0;
	background-position: -130px -60px
}

.desc_notice {
	margin-top: 5px
}

.list_desc {
	margin-top: 22px;
	font-size: 12px;
	color: #959595
}

.list_desc li {
	position: relative;
	margin-top: 6px;
	padding-left: 7px
}

.list_desc li:first-child {
	margin-top: 0
}

.list_desc .ico_dot {
	position: absolute;
	top: 8px;
	left: 1px;
	width: 2px;
	height: 2px;
	background-position: -20px -60px
}

.txt_desc {
	position: relative;
	margin-top: 20px;
	padding-left: 7px;
	font-size: 12px;
	color: #959595;
	word-break: keep-all
}

.txt_desc .ico_dot {
	position: absolute;
	top: 8px;
	left: 1px;
	width: 2px;
	height: 2px;
	background-position: -20px -60px
}

.cont_merge #mArticle {
	min-height: 680px
}

.cont_merge.merge_type2 #mArticle {
	min-height: 100%;
	padding-bottom: 49px
}

.cont_merge.merge_type2 .wrap_btn3 {
	position: static;
	margin-top: 40px
}

.cont_merge .tit_step {
	margin-bottom: 23px
}

.cont_merge .tit_page2 {
	padding-top: 0;
	font-size: 24px;
	line-height: 34px;
	text-align: left;
	letter-spacing: -0.05em
}

.cont_merge .desc_page2 {
	margin-top: 10px;
	text-align: left;
	letter-spacing: -0.05em
}

.cont_merge .img_confirm {
	width: 295px;
	margin: 40px auto 0
}

.cont_merge .guide_info {
	padding-top: 28px
}

.cont_merge .guide_info .link_guide {
	font-size: 14px;
	line-height: 22px;
	color: #000;
	text-decoration: underline
}

.cont_merge .desc_notice {
	margin-top: 0;
	padding-top: 29px;
	font-size: 14px;
	line-height: 22px;
	color: #7c7c7c;
	letter-spacing: -0.04em
}

.cont_merge .emph_notice {
	color: #252525
}

.cont_merge .list_notice {
	padding-top: 15px;
	text-align: left;
	letter-spacing: -0.04em
}

.cont_merge .list_notice li {
	position: relative;
	margin-top: 15px;
	padding-left: 12px;
	font-size: 14px;
	line-height: 22px;
	color: #7c7c7c
}

.cont_merge .list_notice li:after {
	position: absolute;
	left: 0;
	top: 9px;
	width: 4px;
	height: 4px;
	border-radius: 3px;
	background-color: #7c7c7c;
	content: ''
}

.cont_merge .btn_melon, .cont_merge .btn_melon:hover {
	width: 250px;
	height: 64px;
	margin: 0 auto;
	font-size: 16px;
	line-height: 64px;
	color: #fff;
	background-color: #00cd3c
}

.cont_merge .fld_agree {
	margin-top: 20px
}

.cont_merge .fld_apply {
	margin-top: -18px
}

.cont_merge .fld_apply .info_kaccount {
	margin-top: 18px
}

.cont_merge .wrap_info {
	margin-top: -7px
}

.cont_merge .wrap_notice {
	margin-top: 44px
}

.cont_merge .box_account {
	position: relative;
	margin-top: 40px;
	padding: 18px 20px 22px 108px;
	border: 2px solid #fee500;
	border-radius: 8px;
	letter-spacing: -0.01em
}

.cont_merge .box_account .thumb_profile {
	position: absolute;
	left: 20px;
	top: 50%;
	width: 72px;
	height: 72px;
	margin-top: -36px
}

.cont_merge .box_account .thumb_profile .img_frame {
	background-image:
		url("/assets/weblogin/techin/mask_bg_72x72-20f3fbfad3cf19a81005b5496a83a01ee05155fe678d0163a679af1e792953ce.png")
}

.cont_merge .box_account .tit_account {
	display: block;
	display: -webkit-box;
	overflow: hidden;
	max-height: 78px;
	font-size: 20px;
	line-height: 26px;
	color: #252525;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3
}

.cont_merge .box_account .desc_account {
	overflow: hidden;
	padding-top: 6px;
	font-size: 16px;
	line-height: 24px;
	color: #999;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-break: break-all
}

.cont_merge .box_account .txt_date {
	font-size: 16px;
	line-height: 24px;
	color: #999
}

.cont_merge .bg_arrow {
	display: block;
	width: 26px;
	height: 26px;
	margin: 15px auto 2px;
	background-position: -140px -250px
}

.cont_merge .tit_accinfo {
	display: block;
	font-size: 18px;
	line-height: 27px;
	color: #252525
}

.cont_merge .wrap_account {
	margin-top: 17px;
	padding: 0 20px;
	border: 2px solid #e5e5e5;
	border-radius: 8px;
	letter-spacing: 0
}

.cont_merge .item_account {
	margin-top: 2px;
	padding: 22px 0 20px;
	border-top: 1px solid #e5e5e5
}

.cont_merge .item_account:first-child, .cont_merge .item_account.only_account
	{
	margin-top: 0;
	padding-top: 20px;
	border-top: 0 none
}

.cont_merge .item_account .tit_account {
	display: block;
	overflow: hidden
}

.cont_merge .item_account .tit_account .ico_account {
	float: left;
	width: 24px;
	height: 30px;
	margin-right: 8px
}

.cont_merge .item_account .tit_account .ico_melon {
	background-position: -80px -250px
}

.cont_merge .item_account .tit_account .ico_daum {
	background-position: -110px -250px
}

.cont_merge .item_account .tit_account .txt_account {
	display: block;
	display: -webkit-box;
	overflow: hidden;
	max-height: 60px;
	font-size: 18px;
	line-height: 30px;
	color: #4c4c4c;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2
}

.cont_merge .item_account .detail_account {
	overflow: hidden;
	position: relative;
	margin-top: 8px;
	padding: 4px 0
}

.cont_merge .item_account .thumb_profile {
	float: left;
	width: 54px;
	height: 54px;
	margin-right: -18px;
	border-radius: 54px
}

.cont_merge .item_account .thumb_profile .img_frame {
	background-image:
		url("/assets/weblogin/techin/mask_bg_54x54-f863ac4955a56b4e15e058c40113e0f507b4ab38d778e9480cd212954daab694.png")
}

.cont_merge .item_account .account_info {
	overflow: hidden;
	padding-left: 32px
}

.cont_merge .item_account .inner_info {
	display: table;
	table-layout: fixed;
	width: 100%;
	height: 54px
}

.cont_merge .item_account .inner_g {
	display: table-cell;
	vertical-align: middle
}

.cont_merge .item_account .txt_name {
	display: block;
	overflow: hidden;
	font-size: 16px;
	line-height: 22px;
	color: #999;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-break: break-all
}

.cont_merge .item_account .txt_date {
	display: block;
	padding-top: 2px;
	font-size: 16px;
	line-height: 22px;
	color: #999
}

.cont_merge .item_account .state_coupon {
	position: absolute;
	right: 0;
	top: 4px;
	height: 28px;
	padding: 0 12px 0 8px;
	border: 1px solid #00cd3c;
	border-radius: 4px;
	font-size: 14px;
	line-height: 28px;
	color: #00cd3c;
	letter-spacing: -0.05em
}

.cont_merge .item_account .state_coupon .ico_coupon {
	position: absolute;
	right: -1px;
	top: 50%;
	width: 8px;
	height: 10px;
	margin-top: -5px;
	background:
		url("/assets/weblogin/techin/ico_coupon-6475638f4b7a59fefa3021f05cef31ac3db4baca7b75563e24c5a07b1d4a0809.png")
		no-repeat -10px 0
}

.cont_merge .item_account .state_coupon.state_none {
	border-color: #dbdbdb;
	color: #b2b2b2
}

.cont_merge .item_account .state_coupon.state_none .ico_coupon {
	background-position: 0 0
}

.cont_merge .item_account .detail_nodate .state_coupon {
	top: 50%;
	margin-top: -15px
}

.cont_merge .melon_account .detail_account {
	padding-right: 100px
}

.wrap_caution {
	padding-top: 10px;
	letter-spacing: -0.05em
}

.wrap_caution li {
	margin-top: 14px
}

.wrap_caution .link_caution {
	display: block;
	position: relative;
	padding: 0 55px 0 12px;
	font-size: 16px;
	line-height: 22px;
	color: #4c4c4c
}

.wrap_caution .link_caution:after {
	position: absolute;
	left: 0;
	top: 9px;
	width: 4px;
	height: 4px;
	border-radius: 4px;
	background-color: #7c7c7c;
	content: ''
}

.wrap_caution .ico_arr {
	position: absolute;
	right: 0;
	top: 2px;
	width: 18px;
	height: 18px;
	background-position: 0 -280px
}

.wrap_caution .desc_caution {
	display: none;
	padding: 10px 55px 0 12px;
	font-size: 14px;
	line-height: 22px;
	color: #999
}

.wrap_caution .on .ico_arr {
	background-position: -20px -280px
}

.wrap_caution .on .desc_caution {
	display: block
}

.tit_done {
	padding: 0;
	font-size: 28px;
	line-height: 34px;
	text-align: left;
	letter-spacing: -0.05em
}

.info_done {
	margin: 75px 0 0;
	background-color: #fafafa
}

.info_done .wrap_profile {
	position: absolute;
	left: 0;
	right: 0;
	top: -34px
}

.info_done .img_frame {
	background-image:
		url("/assets/weblogin/techin/mask_bg_half-7d6b35c3b7808ef7ab529dd950102374c0d39f25631e618d08d1a5dc66f09ef7.png")
}

.info_done .info_profile {
	margin: 0;
	padding: 45px 24px 0;
	letter-spacing: 0
}

.info_done .tit_account {
	display: block;
	display: -webkit-box;
	overflow: hidden;
	max-height: 56px;
	font-size: 18px;
	line-height: 28px;
	color: #252525;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2
}

.info_done .desc_account {
	overflow: hidden;
	padding-top: 4px;
	font-size: 14px;
	line-height: 20px;
	color: #999;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-break: break-all
}

.info_done .txt_date {
	display: block;
	font-size: 14px;
	line-height: 20px;
	color: #999
}

.info_done .btn_g {
	margin-top: 12px;
	background-color: #fff
}

.info_done .img_done {
	display: block;
	width: 262px;
	margin: 28px auto 0
}

.desc_done {
	position: relative;
	margin-top: 29px;
	padding-left: 12px;
	font-size: 14px;
	line-height: 22px;
	color: #7c7c7c;
	letter-spacing: -0.05em
}

.desc_done:after {
	position: absolute;
	left: 0;
	top: 9px;
	width: 4px;
	height: 4px;
	border-radius: 4px;
	background-color: #7c7c7c;
	content: ''
}

.fld_merge {
	margin-top: 43px
}

.tit_merge {
	display: block;
	margin-bottom: 10px;
	font-weight: normal;
	font-size: 14px;
	line-height: 24px;
	color: #4c4c4c
}

.tit_merge .ico_account {
	float: left;
	margin-right: 6px
}

.error_merge {
	font-size: 14px;
	margin: 10px 0
}

.info_kaccount .thumb_profile {
	float: left;
	width: 40px;
	height: 40px;
	margin: 2px 12px 0 0
}

.info_kaccount .thumb_profile .img_profile {
	display: block;
	width: 40px;
	height: 40px
}

.info_kaccount .thumb_profile .img_frame {
	background:
		url("/assets/weblogin/techin/mask_bg_40x40-f140e77847223b05d930a7e59670458fec711885fc9454f4f1dbbc807d48bdb1.png")
		0 0 no-repeat;
	background-size: 100% 100%
}

.info_kaccount .tit_accounts {
	color: #4c4c4c
}

.info_accounts {
	overflow: hidden;
	display: block
}

.tit_accounts {
	display: block;
	font-weight: normal;
	font-size: 12px;
	color: #7c7c7c
}

.txt_accounts {
	display: block;
	font-family: NotoSans-Bold, sans-serif;
	color: #000
}

.item_accounts {
	padding: 0;
	line-height: 1.5
}

.item_accounts .inp_radio {
	top: 22px;
	left: 22px
}

.item_accounts .lab_g {
	padding: 11px 21px;
	border: 1px solid #d9d9d9
}

.item_accounts .ico_radio {
	float: left;
	margin: 10px 10px 0 0
}

.item_accounts .info_accounts {
	position: relative
}

.item_accounts.item_on .lab_g {
	position: relative;
	z-index: 1;
	border-color: #7c7c7c
}

.item_accounts+.item_accounts {
	margin-top: -1px
}

.wrap_confirm .info_before {
	padding: 23px 30px
}

.wrap_confirm .info_after {
	padding: 27px 30px 30px
}

.list_info {
	width: 380px;
	margin-top: 1px;
	text-align: left
}

.list_info:first-child {
	margin-top: 0
}

.list_info:after {
	content: '';
	display: block;
	clear: both
}

.list_info dt {
	float: left;
	width: 80px;
	padding-right: 7px;
	font-size: 12px;
	line-height: 24px;
	vertical-align: top;
	color: #919191
}

.list_info dd {
	float: left;
	width: 293px;
	font-size: 16px;
	line-height: 24px;
	vertical-align: top;
	color: #252525
}

.info_after .list_info dd {
	font-family: NotoSans-Bold, sans-serif;
	font-size: 20px
}

.desc_info {
	margin-top: 5px
}

.img_confirm {
	display: block;
	max-width: 100%;
	margin: 40px auto 0
}

.info_certified {
	position: relative;
	margin-top: 11px;
	padding-left: 7px;
	font-size: 12px
}

.info_certified .ico_dot {
	position: absolute;
	top: 8px;
	left: 1px;
	width: 2px;
	height: 2px;
	background-position: -20px -60px
}

.link_pwfind {
	display: inline-block;
	margin-top: 25px;
	font-size: 14px;
	text-decoration: underline
}

.link_pwfind:hover {
	text-decoration: underline
}

.info_email {
	margin-top: 30px;
	padding: 27px 24px;
	background-color: #fafafa;
	text-align: center
}

.info_email .tit_accounts {
	margin-bottom: 4px
}

.info_email .txt_accounts {
	font-size: 18px;
	line-height: 28px;
	color: #252525
}

.info_email .tit_accounts2 {
	margin-top: 11px;
	font-size: 16px
}

.info_before {
	position: relative
}

.info_before .txt_accounts {
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕",
		Malgun Gothic, "돋움", dotum, sans-serif;
	color: #7a7a7a
}

.info_after {
	margin-top: 0
}

.bar_info {
	position: relative;
	margin: -1px 30px 0;
	height: 1px;
	background-color: #ebebeb
}

.bar_info .ico_arr {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 26px;
	height: 26px;
	margin: -13px 0 0 -13px;
	background-position: -170px -60px
}

.desc_change {
	margin-top: -8px
}

.fld_check {
	margin-top: 11px
}

.fld_check .item_check {
	padding-right: 0
}

.fld_check .lab_g {
	font-size: 16px
}

.fld_email {
	margin-top: 50px
}

.fld_email .tf_g {
	font-size: 18px;
	font-family: NotoSans-Bold, sans-serif
}

.fld_email .tf_email {
	font-size: 16px
}

.fld_email .lab_g {
	font-size: 16px
}

.fld_email .info_error {
	margin: 8px 0 0 3px
}

.fld_email .list_desc {
	margin-top: 22px
}

.list_account {
	width: 100%;
	min-width: 0;
	max-width: 100%;
	margin-top: 45px;
	padding-bottom: 82px
}

.list_account .tit_list {
	font-size: 12px
}

.list_account dd {
	padding: 16px 0;
	font-family: NotoSans-Bold, sans-serif;
	font-size: 16px;
	line-height: 27px;
	color: #252525;
	border-bottom: 1px solid #f0f0f0;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis
}

.type_popup .wrap_identity {
	margin-bottom: 40px
}

.wrap_btn .btn_more {
	color: #252525;
	border: 1px solid #e0e0e0;
	background-color: #fff
}

.wrap_btn .btn_more .ico_arr {
	width: 12px;
	height: 12px;
	margin: 5px 0 0 3px;
	background-position: -180px -30px
}

.cont_agree .fld_agree {
	margin-top: 40px;
	padding-bottom: 20px
}

.cont_agree .tf_required {
	margin-top: 26px
}

.cont_agree .list_desc {
	margin-top: 40px;
	color: #7c7c7c
}

.cont_profile .tit_step {
	margin-bottom: 23px
}

.cont_profile .fld_agree {
	margin-top: 20px
}

.fld_certify {
	height: 300px
}

.thumb_g {
	display: block;
	width: 100%;
	height: 100%
}

.ico_tooltip {
	width: 14px;
	height: 14px;
	background-position: -130px -80px
}

.ico_notice2 {
	width: 14px;
	height: 14px;
	background-position: -150px -80px
}

.ico_photo2 {
	width: 31px;
	height: 31px;
	background-position: -30px -100px
}

.ico_myinfo2 {
	width: 21px;
	height: 23px;
	background-position: -70px -100px
}

.ico_security {
	width: 20px;
	height: 24px;
	background-position: -100px -100px
}

.ico_state {
	width: 19px;
	height: 24px;
	background-position: -130px -100px
}

.ico_setup {
	width: 23px;
	height: 23px;
	background-position: -160px -100px
}

.wrap_radio .item_check {
	margin-left: 51px
}

.box_manage {
	margin-top: 40px;
	text-align: left
}

.box_manage:first-child, .box_manage.box_address {
	margin-top: 30px
}

.box_manage .tit_comm {
	font-size: 16px
}

.box_manage .link_address {
	display: block;
	width: 240px;
	margin: 30px auto 0;
	padding: 15px;
	border-radius: 4px;
	line-height: 20px;
	text-align: center;
	background-color: #fee500;
	color: #191919
}

.box_manage .tit_box {
	display: block;
	margin-bottom: 10px;
	font-weight: normal;
	font-size: 16px
}

.box_manage .info_box {
	display: block;
	font-size: 12px;
	color: #606060
}

.box_contact {
	padding: 40px 25px;
	text-align: center
}

.box_contact .tit_manage {
	margin-bottom: 10px
}

.box_contact+.list_desc {
	margin-top: 0;
	padding-top: 20px;
	border-top: 1px solid #f5f5f5
}

.box_contact+.wrap_btn6 {
	margin-top: 0
}

.box_notice {
	padding-bottom: 30px;
	border-bottom: 1px solid #ebebeb
}

.box_notice .tit_notice {
	font-weight: normal;
	color: #252525
}

.box_notice .txt_comm {
	margin-top: 20px
}

.tit_comm {
	font-weight: normal
}

.tit_manage {
	display: block;
	font-weight: normal;
	font-size: 12px;
	color: #4a4a4a
}

.txt_comm {
	font-size: 12px;
	color: #606060
}

.desc_comm {
	font-size: 12px;
	color: #959595
}

.desc_comm2 {
	font-size: 16px;
	color: #252525
}

.desc_manage {
	margin-top: 4px
}

.desc_manage2 {
	margin-top: 14px
}

.emph_comm {
	color: #5066aa
}

.btn_type4 {
	width: 46px;
	height: 26px;
	border: 1px solid #e0e0e0;
	font-size: 12px;
	color: #252525
}

.btn_type5 {
	width: 46px;
	height: 26px;
	border: 1px solid #a7b2d4;
	font-size: 12px;
	color: #5066aa
}

.btn_type6 {
	width: 48px;
	height: 28px;
	border: 1px solid #e0e0e0;
	border-radius: 16px;
	font-size: 12px;
	color: #252525
}

.btn_type7 {
	height: 30px;
	padding: 8px 0 8px 11px
}

.btn_type7 .ico_arr {
	width: 9px;
	height: 14px;
	background-position: 0 -80px
}

.wrap_btn4:after {
	display: block;
	content: '';
	clear: both
}

.wrap_btn4 .btn_comm {
	float: left;
	margin-left: 6px
}

.wrap_btn4 .btn_comm:first-child {
	margin-left: 0
}

.wrap_btn5 {
	font-size: 0;
	text-align: center
}

.wrap_btn5 .btn_g {
	display: inline-block;
	width: 276px;
	margin-left: 8px;
	font-size: 14px
}

.wrap_btn5 .btn_g:first-child {
	margin-left: 0
}

.wrap_btn5 .btn_g+.btn_g {
	margin-top: 0
}

.wrap_btn5 .btn_g2 {
	width: 380px
}

.link_type1 {
	box-sizing: border-box;
	height: 26px;
	padding: 0 11px;
	border: 1px solid #e0e0e0;
	font-size: 12px;
	line-height: 24px;
	text-decoration: none;
	color: #252525
}

.link_type1:hover {
	text-decoration: none
}

.wrap_link3 .link_comm {
	float: left
}

.wrap_link3 .link_comm+.link_comm {
	margin-left: 6px
}

.wrap_link3:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.wrap_kaccount .wrap_btn5 {
	margin-top: 40px
}

.wrap_kaccount .wrap_btn5 .btn_merge {
	width: 380px
}

.wrap_kaccount .emph_contact {
	display: block;
	font-family: NotoSans-Bold, sans-serif;
	font-size: 18px;
	line-height: 24px;
	word-break: break-all
}

.wrap_kaccount .list_menu {
	display: table;
	table-layout: fixed;
	width: 100%;
	border-left: 1px solid #d4d4d4
}

.wrap_kaccount .list_menu li {
	display: table-cell;
	text-align: center;
	border: solid #d4d4d4;
	border-width: 1px 1px 1px 0
}

.wrap_kaccount .list_menu li.on, .wrap_kaccount .list_menu li:hover {
	position: relative;
	border-color: #1a1a1a;
	background-color: #1a1a1a
}

.wrap_kaccount .list_menu li.on .link_menu, .wrap_kaccount .list_menu li:hover .link_menu
	{
	color: #fff;
	opacity: 1
}

.wrap_kaccount .list_menu li .link_menu {
	display: block;
	padding: 11px 0;
	font-size: 16px;
	color: #000;
	opacity: .5
}

.wrap_kaccount .list_menu li.disabled:hover {
	border-color: #d4d4d4;
	background-color: #f2f2f2
}

.wrap_kaccount .list_menu li.disabled .link_menu {
	color: #ccc
}

.wrap_kaccount .desc_guide {
	margin-top: 60px;
	padding: 40px;
	text-align: center;
	background-color: #fafafa
}

.link_set, .box_set {
	display: block;
	position: relative;
	padding: 10px 25px 10px 0;
	border-bottom: 1px solid #ebebeb;
	font-size: 16px;
	color: #252525
}

.link_set:after, .box_set:after {
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden;
	content: ''
}

.link_set .tit_set, .box_set .tit_set {
	font-weight: normal
}

.link_set .txt_set, .box_set .txt_set {
	float: right;
	color: #5066aa
}

.link_set .txt_set.set_type2, .box_set .txt_set.set_type2 {
	color: #adadad
}

.link_set .ico_arr {
	position: absolute;
	top: 16px;
	right: 0;
	width: 9px;
	height: 14px;
	background-position: 0 -80px
}

.link_set.link_profile {
	margin-top: 10px
}

.link_set.link_profile .ico_arr {
	top: 23px
}

.link_set .txt_invalid {
	position: absolute;
	right: 27px;
	top: 12px;
	font-size: 16px;
	line-height: 20px;
	color: #adadad
}

.link_set .txt_invalid .ico_error {
	width: 14px;
	height: 14px;
	margin: 4px 6px 0 0
}

.box_set .link_tooltip {
	position: absolute;
	top: 13px;
	right: 0;
	padding: 3px 0 3px 6px;
	font-size: 0
}

.box_set .txt_guide {
	font-weight: normal;
	color: #adadad
}

.box_set .wrap_link3 {
	position: absolute;
	top: 9px;
	right: 0
}

.list_set {
	position: relative
}

.list_set dt {
	font-size: 12px;
	color: #252525
}

.list_set dd .inner_txt {
	font-size: 16px
}

.list_set dd .inner_txt .ico_notice2 {
	float: left;
	margin: 7px 8px 0 0
}

.list_set dd .txt_guide {
	color: #adadad
}

.list_set dd .txt_guide2 {
	color: #5066aa
}

.list_set dd .txt_guide3 {
	color: #ccc
}

.list_set dd .txt_error {
	color: #ff6229
}

.list_set dd .ico_bubble2 {
	display: inline-block;
	width: 54px;
	height: 20px;
	margin: 1px 0 1px 10px;
	border: 1px solid #5066aa;
	border-radius: 13px;
	font-size: 10px;
	line-height: 20px;
	text-align: center;
	vertical-align: top;
	color: #5066aa
}

.list_set dd .item_switch {
	position: absolute;
	top: 10px;
	right: 0
}

.list_set .ico_star {
	width: 6px;
	height: 6px;
	margin: 6px 0 0 1px;
	background-position: -20px -70px
}

.list_set .link_set {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border-bottom: 0 none
}

.list_set .manage_btn {
	position: absolute;
	top: 9px;
	right: 0
}

.list_set .manage_btn2 {
	position: absolute;
	top: 7px;
	right: 0
}

.list_set .tf_g {
	height: 24px;
	padding: 0;
	border: 0 none
}

.wrap_inp .manage_btn {
	float: right;
	margin-top: 10px
}

.info_set {
	margin-top: 40px
}

.info_set .list_set {
	margin-top: 40px
}

.info_set .list_set:first-child {
	margin-top: 0
}

.info_set .list_set dd {
	padding: 0;
	border-bottom: 0 none
}

.info_set .list_set .wrap_inp {
	border-bottom: 1px solid #ebebeb
}

.info_set .list_set .inner_txt {
	display: block;
	padding: 10px 126px 10px 0;
	border-bottom: 1px solid #ebebeb
}

.info_set .list_on .wrap_inp {
	border-color: #7c7c7c
}

.info_set .wrap_inp {
	padding: 10px 126px 10px 0
}

.wrap_link {
	margin-top: 60px
}

.wrap_link .link_account {
	display: inline-block;
	font-size: 12px;
	color: #4f66aa;
	text-decoration: underline;
	vertical-align: top
}

.wrap_link2 {
	margin-top: 20px
}

.wrap_link2 .link_account {
	position: relative;
	padding-right: 14px
}

.wrap_link2 .link_account .ico_arr {
	position: absolute;
	top: 5px;
	right: 0;
	width: 7px;
	height: 10px;
	background-position: -10px -80px
}

.manage_comm {
	height: 100%;
	font-size: 14px;
	letter-spacing: 0;
	color: #252525
}

.manage_comm #kakaoHead {
	overflow: visible;
	position: relative;
	height: 57px;
	border-bottom: 1px solid #ebebeb;
	background-color: transparent;
	text-align: center
}

.manage_comm #kakaoHead .wrap_head {
	position: relative;
	width: 1200px;
	margin: 0 auto
}

.manage_comm #kakaoHead h1 {
	position: absolute;
	top: 17px;
	left: 0;
	z-index: 10
}

.manage_comm #kakaoHead .link_logo {
	float: left;
	height: 22px;
	margin-top: 2px;
	font-size: 15px;
	color: #252525
}

.manage_comm #kakaoHead .logo_kakao {
	float: left;
	margin-right: 6px
}

.manage_comm #kakaoHead .service_kakao {
	float: left;
	font-weight: normal;
	font-size: 15px
}

.manage_comm #kakaoHead #kakaoGnb {
	width: 600px;
	height: 58px;
	margin: 0 auto
}

.manage_comm #kakaoHead #kakaoGnb .list_gnb {
	display: inline-block;
	overflow: hidden;
	height: 58px
}

.manage_comm #kakaoHead #kakaoGnb li {
	float: left;
	margin-left: 35px
}

.manage_comm #kakaoHead #kakaoGnb li:first-child {
	margin-left: 0
}

.manage_comm .link_gnb {
	display: block;
	height: 39px;
	padding: 19px 5px 0;
	letter-spacing: 0
}

.manage_comm .on .link_gnb, .manage_comm .link_gnb:hover {
	height: 37px;
	border-bottom: 2px solid #333
}

.manage_comm .info_login {
	overflow: hidden;
	position: absolute;
	top: 22px;
	right: 0;
	font-size: 12px;
	z-index: 10;
	color: #7c7c7c
}

.manage_comm #kakaoWrap {
	position: relative;
	min-width: 1280px;
	min-height: 100%
}

.manage_comm #kakaoContent {
	padding-bottom: 140px
}

.manage_comm #mArticle {
	max-width: 560px;
	margin: 50px auto 0
}

.manage_comm #kakaoFoot {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px;
	padding: 20px 0 60px;
	border-top: 1px solid #e6e6e6;
	font-size: 12px;
	text-align: center;
	letter-spacing: -0.03em
}

.manage_type2 #mArticle {
	width: 616px;
	max-width: none;
	margin: 60px auto 0
}

.tit_kaccount {
	font-weight: normal;
	font-size: 20px;
	letter-spacing: 0
}

.tit_accountinfo {
	margin-bottom: 24px;
	font-weight: 500;
	font-size: 16px;
	color: rgba(0, 0, 0, 0.85);
	line-height: 20px;
	letter-spacing: 0
}

html:lang(ko) .tit_kaccount, html:lang(en) .tit_kaccount {
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, '맑은 고딕',
		Malgun Gothic, '돋움', dotum, sans-serif
}

.wrap_kaccount {
	margin-top: 10px;
	padding-bottom: 80px;
	border-top: 1px solid #7c7c7c
}

.cont_home .wrap_kaccount {
	margin-top: 0;
	border-top: 0 none
}

.info_home .thumb_profile {
	width: 48px;
	height: 48px;
	margin: 0 8px 0 0
}

.info_home .thumb_profile .img_profile {
	width: 48px;
	height: 48px
}

.info_home .txt_accounts {
	font-size: 16px
}

.info_home .desc_accounts {
	display: block;
	margin-top: 2px;
	font-size: 12px;
	color: #7c7c7c
}

.info_home .thumb_service {
	display: inline-block;
	width: 20px;
	height: 20px;
	margin: -1px 0 -1px 4px;
	vertical-align: top
}

.wrap_quick {
	margin-top: 40px
}

.wrap_quick .desc_comm {
	color: #7c7c7c
}

.list_quick {
	margin-top: 20px;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc
}

.list_quick li {
	position: relative;
	border-top: 1px solid #ebebeb
}

.list_quick li:first-child {
	border-top: 0 none
}

.list_quick .box_quick {
	display: block;
	position: relative;
	padding: 30px 0 28px 84px
}

.list_quick .box_quick .thumb_quick {
	position: absolute;
	top: 50%;
	left: 0;
	width: 66px;
	height: 66px;
	margin-top: -33px;
	border-radius: 50%;
	background-color: #fafafa;
	text-align: center
}

.list_quick .box_quick .ico_myinfo2 {
	margin-top: 22px
}

.list_quick .box_quick .ico_security {
	margin-top: 20px
}

.list_quick .box_quick .ico_state {
	margin-top: 21px
}

.list_quick .box_quick .ico_setup {
	margin-top: 22px
}

.list_quick .box_quick .tit_quick {
	font-size: 16px
}

.list_quick .box_quick .desc_quick {
	margin-top: 9px;
	color: #7c7c7c
}

.list_quick .box_quick .desc_date {
	margin-top: 2px;
	color: #4f66aa
}

.list_quick .link_quick {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.list_quick .link_quick .ico_arr {
	position: absolute;
	top: 50%;
	right: 0;
	width: 9px;
	height: 14px;
	margin-top: -7px;
	background-position: 0 -80px
}

.list_quick .link_password {
	position: absolute;
	bottom: 28px;
	left: 327px;
	z-index: 10;
	color: #4f66aa;
	text-decoration: underline
}

.link_set .info_kaccount .thumb_profile {
	margin: 0 10px 0 0
}

.link_set .info_accounts {
	padding: 7px 0 9px
}

.link_set .txt_accounts {
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕",
		Malgun Gothic, "돋움", dotum, sans-serif
}

.list_myinfo.list_on dd {
	border-color: #7c7c7c
}

.list_myinfo dd {
	position: relative;
	padding: 10px 60px 10px 0;
	border-bottom: 1px solid #ebebeb
}

.list_myinfo .wrap_inp:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.list_myinfo .wrap_inp .item_inp {
	float: left
}

.list_myinfo .item_radio {
	height: auto;
	line-height: initial
}

.list_myinfo .lab_radio {
	font-size: 0
}

.list_myinfo .lab_radio .txt_radio {
	font-size: 16px;
	line-height: 1.5
}

.list_myinfo .lab_radio .ico_radio {
	margin: 4px 10px 0 0
}

.list_myinfo .lab_check .txt_check {
	font-size: 16px;
	line-height: 1.5
}

.list_myinfo .lab_check .ico_check {
	margin: 2px 10px 0 0
}

.list_myinfo .type_birth {
	height: auto;
	border-bottom: 0 none
}

.list_myinfo .type_birth .select_month {
	width: 78px
}

.list_myinfo .type_birth .wrap_check {
	margin-top: 0
}

.list_myinfo .type_birth .item_check {
	margin-left: 20px
}

.list_myinfo .wrap_agree {
	padding: 10px 0
}

.list_myinfo .wrap_agree:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.list_myinfo .wrap_agree .item_check {
	float: left;
	padding-right: 0
}

.list_myinfo .wrap_agree .link_more {
	float: left;
	margin: 5px 0 0 14px;
	font-size: 12px;
	color: #5066aa;
	text-decoration: underline
}

.list_myinfo .item_select .link_selected {
	height: 24px;
	font-size: 16px;
	line-height: 1.5
}

.list_myinfo .item_select .link_selected .ico_arr {
	margin: 5px 0 0 8px
}

.list_myinfo.myinfo_address {
	border-bottom: 0
}

.list_myinfo.myinfo_address dd {
	padding-right: 0;
	border-bottom: 1px solid #ebebeb
}

.list_myinfo.myinfo_address .zip_code .manage_btn {
	top: 2px
}

.list_myinfo.myinfo_address .zip_code .btn_g {
	width: 120px;
	height: 35px;
	font-size: 14px
}

.fld_address .list_myinfo {
	margin-top: 40px
}

.fld_address .list_myinfo:first-child {
	margin-top: 30px
}

.fld_address .list_myinfo .ico_star {
	width: 6px;
	height: 6px;
	margin: 6px 0 0 1px;
	background-position: -20px -70px
}

.fld_address .list_myinfo dt {
	font-size: 12px;
	color: #4a4a4a
}

.fld_address .list_myinfo dd {
	padding: 0;
	border: 0 none
}

.fld_address .list_myinfo dd+dd {
	margin-top: 10px
}

.fld_address .list_myinfo .info_zipcode {
	border: 0 none;
	box-shadow: 0 1px 5px 0 rgba(0, 0, 0, 0.2)
}

.fld_address .myinfo_address .item_tf .tf_g:disabled {
	color: #252525
}

.fld_address .zip_code .item_tf .tf_g {
	padding-right: 130px
}

.fld_address .zip_code .manage_btn {
	position: absolute;
	top: 2px;
	right: 0
}

.fld_address .box_address .list_set dd {
	padding: 0
}

.fld_address .box_address .list_set dd+dd {
	margin-top: 10px
}

.fld_address .box_address .list_set .zip_code {
	padding-right: 130px
}

.fld_address .box_address .list_set .info_zipcode {
	margin: 0;
	padding: 0
}

.fld_address .box_address .list_set .info_phone {
	padding: 0
}

.fld_address .wrap_btn5 {
	margin-top: 30px
}

.fld_address .wrap_btn5 .btn_g {
	width: 303px
}

.box_myinfo .list_set {
	border-bottom: 0 none
}

.box_myinfo dd {
	padding: 0
}

.box_myinfo dd .inner_txt {
	display: block;
	padding: 10px 126px 10px 0;
	border-bottom: 1px solid #ebebeb
}

.box_myinfo .wrap_inp {
	padding: 10px 126px 10px 0;
	border-bottom: 1px solid #ebebeb
}

.box_myinfo .list_on .wrap_inp {
	border-color: #7c7c7c
}

.manage_email {
	margin-top: 20px
}

.manage_email .btn_g {
	height: 30px;
	padding: 0 17px;
	font-size: 12px;
	line-height: 28px
}

.manage_email .box_email {
	position: relative;
	padding: 10px 25px 20px 0;
	border-top: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb
}

.manage_email .box_email .link_set {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border-bottom: 0 none
}

.manage_email .box_email .link_set .ico_arr {
	top: 50%;
	margin-top: -7px
}

.manage_email .box_email .btn_email {
	position: absolute;
	top: 10px;
	right: 19px
}

.manage_email .box_email .desc_email {
	margin-top: 14px
}

.manage_email .list_email .desc_email {
	margin-top: 10px
}

.manage_email .info_email {
	margin-top: 0;
	padding: 0;
	text-align: left;
	background-color: transparent
}

.manage_email .info_email .ico_bubble {
	display: inline-block;
	height: 30px;
	margin: 0 0 -6px 16px;
	padding: 0 12px;
	border-radius: 15px;
	font-size: 12px;
	line-height: 30px;
	vertical-align: top;
	color: #fff;
	background-color: #999
}

.manage_email .info_email .txt_email {
	font-size: 16px
}

.manage_email .info_email .txt_represent {
	color: #4f66a9
}

.manage_email .info_email .ico_notice2 {
	float: left;
	margin: 7px 8px 0 0
}

.manage_email .info_email2 {
	padding-right: 0
}

.manage_email .info_error .txt_email {
	color: #ff6229
}

.manage_email .item_check {
	margin-top: 40px
}

.manage_email .lab_check .txt_check {
	font-size: 14px
}

.box_address .list_set {
	margin-top: 40px
}

.box_address .list_set dd {
	padding: 10px 0 8px 0
}

.box_address .list_set .lab_placeholder {
	height: auto;
	line-height: 1.5
}

.box_address .list_set2 dd {
	padding-top: 3px
}

.box_address .type_phone {
	height: auto;
	border-width: 0
}

.box_address .type_phone .item_tf {
	float: none
}

.box_address .type_phone .item_tf:before {
	top: 2px
}

.box_address.type_nodata {
	text-align: center;
	margin: 63px 0 0;
	padding-bottom: 40px;
	border-bottom: 1px solid #ebebeb
}

.box_address.type_nodata .link_address {
	display: inline-block;
	border-bottom: 0
}

.box_address.type_nodata .link_address .ico_arr {
	right: 11px
}

.box_address .list_address {
	margin-top: 30px
}

.box_address .list_address dt {
	font-family: NotoSans-Bold, sans-serif
}

.box_address .list_address dt .emph_comm {
	margin-left: 6px;
	color: #2c88de
}

.box_address .list_address dd {
	margin-top: 10px;
	padding: 0 0 30px;
	font-size: 16px;
	line-height: 26px
}

.box_address .list_address dd .txt_name {
	padding-bottom: 4px
}

.box_address .list_address dd .txt_phone {
	margin-top: 5px;
	font-size: 14px;
	line-height: 20px;
	color: #959595
}

.box_address .list_address dd .desc_invalid {
	margin-top: 20px;
	padding: 20px;
	font-size: 12px;
	line-height: 18px;
	color: #4a4a4a;
	background-color: #fafafa
}

.box_address .list_address dd .desc_invalid .ico_error {
	width: 14px;
	height: 14px;
	margin: 2px 6px 0 0
}

.box_address .list_address .manage_btn {
	top: -28px
}

.box_address .info_address {
	margin-top: 9px;
	padding-bottom: 16px;
	font-size: 16px;
	line-height: 26px
}

.new_address .box_set {
	padding: 0 100px 20px 0
}

.new_address .box_set .wrap_link3 {
	top: -1px
}

.blank_address {
	padding: 30px 0 60px;
	border-bottom: 1px solid #e5e5e5;
	text-align: center
}

.blank_address .txt_guide {
	color: #adadad
}

.manage_contact .type_phone {
	height: 47px;
	border-bottom-width: 2px
}

.manage_contact .type_phone .item_tf .tf_g {
	padding-left: 15px;
	letter-spacing: 0
}

.manage_contact .type_phone+.wrap_btn5 {
	margin-top: 124px
}

.manage_contact .item_select .link_selected {
	height: 45px;
	line-height: 44px
}

.manage_contact .item_tf+.item_tf {
	margin-top: 0
}

.manage_contact .item_tf .tf_g {
	height: 47px;
	padding: 11px 100px 11px 0;
	border-width: 0 0 2px 0
}

.manage_contact .item_tf .tf_g:focus {
	border-color: #191919
}

.manage_contact .item_tf .tf_g[readonly="readonly"] {
	color: #ccc
}

.manage_contact .item_tf .tf_g[readonly="readonly"]:focus {
	border-color: #ebebeb
}

.manage_contact .item_tf .lab_placeholder {
	height: 45px;
	font-size: 16px;
	line-height: 45px;
	color: #ccc
}

.manage_contact .item_tf+.wrap_btn5 {
	margin-top: 124px
}

.manage_contact .util_tf {
	top: 12px
}

.manage_contact .util_tf .btn_g {
	width: 83px;
	height: 30px;
	margin: -4px 0 -2px;
	font-size: 12px
}

.manage_contact .util_tf .info_count {
	margin-top: 3px;
	font-size: 12px;
	line-height: 18px;
	vertical-align: top;
	color: #b7b7b7
}

.manage_contact .info_error {
	margin-top: 16px;
	font-size: 12px
}

.manage_contact .link_verify {
	margin-top: 20px;
	color: #191919
}

.manage_contact .wrap_agree {
	margin-top: 40px
}

.manage_contact .wrap_agree .desc_comm {
	margin-top: 14px
}

.manage_contact .wrap_agree .link_more {
	display: inline-block;
	margin-top: 30px;
	font-size: 12px;
	color: #5066aa;
	vertical-align: top;
	text-decoration: underline
}

.manage_contact .wrap_agree2 {
	padding: 20px;
	background-color: #fafafa
}

.manage_contact .lab_check .txt_check {
	font-size: 16px;
	line-height: 1.5
}

.manage_contact .wrap_btn5 {
	margin-top: 40px
}

.manage_contact .wrap_btn5 .btn_g {
	font-size: 16px
}

.list_manage {
	border-bottom: 1px solid #ebebeb
}

.list_manage.list_on {
	margin-top: -1px;
	border-top: 1px solid #7c7c7c;
	border-bottom-color: #7c7c7c
}

.list_manage dt {
	padding: 10px 0;
	font-size: 16px
}

.list_manage .desc_date {
	padding-bottom: 10px
}

.list_manage .fld_agree {
	margin-top: 20px;
	padding-bottom: 30px
}

.list_manage .fld_agree .item_check {
	margin-top: 0
}

.list_manage .fld_agree .wrap_btn4 {
	margin-top: 20px
}

.list_manage .lab_check .ico_check {
	margin: 2px 10px 0 0
}

.list_manage .lab_check .txt_check {
	font-size: 16px;
	line-height: 1.5
}

.list_manage .info_agree {
	margin-top: 10px
}

.info_agree .desc_comm {
	margin-top: 20px
}

.info_agree .desc_comm:first-child {
	margin-top: 0
}

.info_agree .link_more {
	font-size: 12px;
	color: #959595;
	text-decoration: underline
}

.info_terms .link_comm {
	margin-top: 20px
}

.wrap_info {
	margin-top: 30px
}

.wrap_info .info_terms {
	margin-top: 30px;
	padding-top: 10px;
	border-top: 1px solid #ebebeb
}

.wrap_info .info_terms:first-child {
	margin-top: 0;
	padding-top: 0;
	border-top: 0 none
}

.fld_apply2 .tit_password {
	font-size: 16px
}

.fld_apply2 .desc_password {
	margin: 10px 0;
	font-size: 12px;
	color: #606060
}

.fld_apply2 .box_manage {
	margin-top: 30px
}

.fld_apply2 .wrap_item {
	margin-top: 30px
}

.fld_apply2 .info_error {
	font-size: 12px
}

.fld_apply2 .info_error+.item_inp {
	margin-top: 10px
}

.fld_apply2 .item_tf {
	margin-top: 0
}

.fld_apply2 .item_tf .tf_g {
	height: 45px;
	padding: 10px 40px 10px 0
}

.fld_apply2 .item_tf .tf_email {
	color: #CCC
}

.fld_apply2 .item_tf .tf_email:focus {
	border-bottom-color: #ebebeb
}

.fld_apply2 .item_tf .lab_placeholder {
	height: 44px;
	line-height: 44px
}

.fld_apply2 .wrap_btn5 {
	margin-top: 40px
}

.wrap_info .info_manage {
	margin-top: 20px
}

.wrap_info .info_manage:first-child {
	margin-top: 0
}

.wrap_info2 {
	margin-top: 17px
}

.wrap_cash {
	margin-top: 29px
}

.info_manage {
	border: 1px solid #ebebeb;
	font-size: 12px
}

.info_manage .info_head {
	position: relative;
	height: 18px;
	padding: 14px 120px 17px 16px;
	background-color: #fafafa
}

.info_manage .info_head .tit_info {
	font-size: 15px;
	font-weight: normal
}

.info_manage .info_head .link_comm {
	position: absolute;
	top: 10px;
	right: 19px
}

.info_manage .info_head .btn_comm {
	position: absolute;
	top: 12px;
	right: 10px;
	padding: 5px
}

.info_manage .info_head .ico_signout {
	display: block;
	width: 8px;
	height: 14px;
	background-position: 0 -80px
}

.info_manage .info_body {
	padding: 16px 17px 16px;
	word-break: keep-all
}

.info_manage .info_body .item_inp {
	padding-bottom: 9px
}

.info_manage .info_body .item_inp:before {
	display: block;
	margin: 16px 0 19px;
	height: 1px;
	background-color: #ebebeb;
	content: ''
}

.info_manage .info_body .inp_check {
	top: 21px
}

.info_manage .list_desc {
	margin-top: 0
}

.info_manage .list_desc li {
	margin-top: 0;
	line-height: 18px
}

.info_service .info_body {
	padding: 0 20px 18px
}

.info_service .list_service {
	overflow: hidden
}

.info_service .list_service li {
	position: relative;
	float: left;
	display: table;
	width: 50%;
	height: 40px;
	margin-top: 20px
}

.info_service .list_service .thumb_service {
	position: absolute;
	left: 0;
	top: 0;
	width: 40px;
	height: 40px
}

.info_service .list_service .thumb_service:after {
	position: absolute;
	left: 0;
	top: 0;
	display: block;
	width: 100%;
	height: 100%;
	border: 1px solid #000;
	opacity: .04;
	box-sizing: border-box;
	content: ''
}

.info_service .list_service .ico_account {
	float: left;
	margin: 2px 10px 0 1px
}

.info_service .list_service .ico_melon2 {
	margin: 2px 10px 0 1px
}

.info_service .list_service .ico_kstory {
	margin: 1px 10px 0 0
}

.info_service .list_service .txt_service {
	display: table-cell;
	overflow: hidden;
	width: 100%;
	max-width: 209px;
	padding: 0 10px 0 50px;
	font-size: 14px;
	color: #252525;
	box-sizing: border-box;
	vertical-align: middle;
	text-overflow: ellipsis;
	white-space: nowrap
}

.info_service .list_service .emph_service {
	display: block;
	overflow: hidden;
	margin-top: 3px;
	font-size: 11px;
	color: #959595;
	text-overflow: ellipsis;
	white-space: nowrap
}

.info_agree2 {
	margin-top: 30px
}

.info_agree2 .info_head {
	height: 20px;
	padding: 8px 20px 10px
}

.info_agree2 .item_check {
	padding-right: 0
}

.info_agree2 .inp_check {
	top: 0
}

.info_agree2 .lab_check .txt_check {
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕",
		Malgun Gothic, "돋움", dotum, sans-serif;
	font-size: 14px;
	line-height: 20px
}

.info_agree2 .lab_check .ico_check {
	margin: 0 6px 0 0
}

.fld_agree2 {
	margin-top: 20px
}

.fld_agree2 .item_check {
	margin-top: 0
}

.fld_agree2 .lab_check .ico_check {
	margin: 2px 10px 0 0
}

.fld_agree2 .lab_check .txt_check {
	font-size: 16px;
	line-height: 1.5
}

.fld_agree3 {
	margin-top: 40px
}

.fld_agree3 .item_check {
	margin-top: 19px
}

.fld_agree3 .item_check:first-child {
	margin-top: 0
}

.fld_agree3 .lab_check .ico_check {
	margin: 0 10px 0 0
}

.fld_agree3 .lab_check .txt_check {
	font-size: 14px;
	line-height: 20px
}

.info_complete {
	padding: 96px 0 100px;
	border-bottom: 1px solid #e5e5e5;
	text-align: center
}

.info_complete .tit_info {
	display: block;
	font-size: 16px
}

.info_complete .txt_info {
	margin-top: 10px;
	font-size: 12px;
	color: #606060
}

.cont_account #mArticle {
	max-width: 940px;
	padding: 0 30px
}

.cont_account .box_manage {
	margin-top: 53px
}

.cont_account .box_manage[role=tabpanel] {
	margin-top: 20px
}

.cont_account .box_manage:first-child {
	margin-top: 30px
}

.cont_account .box_manage.txt_manage {
	margin-top: 22px
}

.cont_account .wrap_privacy.wrap_kaccount {
	margin-top: 11px;
	padding-bottom: 60px
}

.cont_account .wrap_privacy .info_list {
	margin-top: 40px;
	padding-bottom: 12px
}

.cont_account .wrap_privacy .txt_comm {
	font-size: 12px;
	color: rgba(0, 0, 0, 0.85)
}

.cont_account .wrap_account .wrap_tbl {
	margin-top: 40px
}

.cont_account .list_state {
	margin-top: 30px
}

.cont_account .list_state li {
	margin-top: 10px
}

.cont_account .link_info {
	display: inline-block;
	font-size: 12px;
	text-decoration: underline;
	color: #191919
}

.cont_account .txt_comm+.link_info {
	margin-top: 20px
}

.cont_account .wrap_tbl {
	margin-top: 40px
}

.cont_account .wrap_tbl+.wrap_tbl {
	margin-top: 46px
}

.cont_account .wrap_tbl+.info_list {
	margin-top: 17px;
	padding-bottom: 0
}

.cont_account .wrap_tbl .tbl_g th {
	padding: 12px;
	border-top-width: 2px;
	border-right: 0 none;
	border-color: #d4d4d4;
	border-top-color: #1e1e1e;
	font-weight: normal;
	font-size: 14px;
	line-height: 24px;
	color: #252525;
	background-color: #fff
}

.cont_account .wrap_tbl .tbl_g td {
	padding: 12px 19px;
	border-color: #d4d4d4;
	font-size: 12px;
	line-height: 20px;
	vertical-align: top;
	color: rgba(0, 0, 0, 0.5)
}

.cont_account .wrap_tbl .tbl_g .col_empty {
	text-align: center;
	color: rgba(0, 0, 0, 0.5)
}

.cont_account .wrap_tbl .tbl_sessions td:last-child {
	padding: 10px 16px;
	text-align: center;
	line-height: 25px
}

.cont_account .wrap_tbl .tbl_sessions .btn_logout {
	display: inline-block;
	width: 80px;
	height: 26px;
	border: 1px solid #e0e0e0;
	font-size: 12px;
	line-height: 24px;
	color: #252525;
	box-sizing: border-box
}

.info_list .tit_list {
	display: block;
	font-size: 12px;
	color: #4a4a4a
}

.info_list .list_desc {
	margin-top: 6px;
	color: rgba(0, 0, 0, 0.5)
}

.info_list .list_desc li+li {
	margin-top: 2px
}

.info_list .list_desc li {
	padding-left: 10px
}

.info_list .list_desc .ico_dot {
	left: 2px;
	top: 9px
}

.box_more {
	margin-top: 20px;
	border: 1px solid #e0e0e0;
	font-size: 0
}

.box_more .btn_more {
	width: 100%;
	height: 52px;
	border: 0 none;
	color: #000
}

.box_more .btn_more .ico_arr {
	margin: 7px 0 0 7px
}

.box_more .btn_top {
	width: 52px;
	height: 52px;
	background-color: #f5f5f5
}

.box_more .btn_top .ico_arr {
	width: 18px;
	height: 12px;
	margin-top: 6px;
	background-position: -60px -200px
}

.box_more.box_close .btn_more {
	width: calc(100% - 52px)
}

.tit_state {
	display: block;
	margin: 40px 0 8px;
	font-size: 12px;
	color: #4a4a4a
}

.wrap_kaccount .tit_state:first-child {
	margin-top: 30px
}

.list_app {
	overflow: hidden;
	margin: 0 0 -4px -4px;
	border-bottom: 1px solid #ebebeb
}

.list_app li {
	float: left;
	margin: 0 0 4px 4px
}

.list_app a {
	display: block
}

.list_app .tit_app {
	display: inline-block;
	margin-left: 3px;
	line-height: 29px;
	font-weight: normal
}

.list_app .ico_app {
	vertical-align: top
}

.connect_cont {
	overflow: hidden;
	position: relative;
	padding: 12px 0;
	border-bottom: 1px solid #ebebeb;
	font-size: 16px
}

.connect_cont .list_app {
	margin-right: 230px;
	border-bottom: 0
}

.connect_cont .desc_app {
	line-height: 32px
}

.connect_cont .link_account {
	position: absolute;
	right: 0;
	top: 16px;
	color: #5066aa
}

.connect_cont .link_account .ico_account {
	width: 8px;
	height: 14px;
	margin: 5px 0 0 16px;
	background-position: 0 -80px
}

.state_cont {
	margin-bottom: 40px;
	padding-top: 0
}

.state_cont .list_app {
	margin-right: 100px
}

.state_cont .link_account {
	top: 2px
}

.info_state {
	overflow: hidden;
	margin: 20px 0 0;
	border-bottom: 1px solid #ebebeb
}

.info_state .thumb_state {
	float: left;
	width: 68px;
	height: 68px;
	margin: 0 30px 0 10px
}

.info_state .img_state {
	vertical-align: top
}

.info_state .detail_state {
	overflow: hidden;
	position: relative;
	padding: 7px 160px 7px 0;
	color: #959595;
	font-size: 12px
}

.info_state .guide_state {
	display: block;
	margin-top: 15px;
	font-size: 16px;
	color: #252525
}

.info_state .wrap_link {
	position: absolute;
	right: 0;
	bottom: 7px;
	margin-top: 0
}

.info_state .wrap_link .link_account {
	float: left;
	margin-left: 10px
}

.info_state .wrap_link .link_account:first-child {
	margin-left: 0
}

.info_state .thumb_profile .img_frame {
	background-image:
		url("/assets/weblogin/techin/retina/mask_bg_40x40-e33b97d84816e9cd102861314caa2648acf240e348a6eafa761a39fc2d5cb7b2.png")
}

.info_account.info_state {
	text-align: left;
	border-bottom: 0
}

.info_account.info_state:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.info_account.info_state .wrap_profile {
	position: relative;
	float: left;
	width: 80px;
	margin-right: 30px
}

.info_account.info_state .thumb_profile {
	width: 80px;
	height: 80px
}

.info_account.info_state .btn_photo {
	top: auto;
	bottom: 0
}

.info_account.info_state .btn_photo .ico_photo {
	width: 31px;
	height: 31px;
	background-position: -30px -100px
}

.info_account.info_state .info_profile {
	margin: 0
}

.info_account.info_state .info_profile .list_set {
	overflow: hidden;
	padding-top: 13px;
	box-sizing: border-box
}

.info_account.info_state .info_profile .item_tf .btn_g {
	margin: 0;
	border-radius: 0;
	height: 26px;
	line-height: 1.5;
	padding: 0 11px;
	font-size: 12px
}

.info_state.info_receive {
	margin-top: 10px;
	padding-bottom: 17px
}

.info_state.info_receive .item_check {
	margin-bottom: 21px
}

.info_state.info_receive .item_check .txt_check {
	font-size: 16px
}

.info_state.info_use {
	margin-top: 10px;
	padding: 10px 0;
	border-top: 1px solid #ebebeb
}

.img_certify {
	overflow: hidden;
	display: inline-block;
	line-height: 0;
	font-size: 0;
	background:
		url("/assets/weblogin/techin/img_certify-fb2000a172114bb1509126f79e63fd6132c5874c1886d058b4c27f9a335cb227.png");
	background-position: -4px -132px;
	vertical-align: top;
	text-indent: -9999px;
	width: 120px;
	height: 120px
}

.img_certify.img_step2 {
	background-position: -134px -132PX
}

.img_certify.img_step3 {
	background-position: -264px -132px
}

.wrap_certify .desc_certify {
	font-size: 12px;
	color: #4a4a4a
}

.wrap_certify .desc_tab {
	font-size: 16px;
	color: #252525
}

.wrap_certify .list_menu {
	margin: 16px 0 20px
}

.wrap_certify .list_certify {
	margin: 40px 0 40px 30px;
	font-size: 0
}

.wrap_certify .list_certify li {
	display: inline-block;
	width: 120px;
	margin-left: 70px;
	font-size: 12px;
	text-align: center;
	vertical-align: top
}

.wrap_certify .list_certify li:first-child {
	margin-left: 0
}

.wrap_certify .list_certify .txt_certify {
	display: inline-block;
	margin-top: 17px;
	color: #7f7f7f
}

.wrap_certify .tit_certify {
	display: block;
	margin: 30px 0 10px;
	font-size: 16px;
	color: #252525;
	font-weight: normal
}

.wrap_certify .tit_certify:first-child {
	margin-top: 0
}

.wrap_certify .box_select .wrap_inp {
	border-bottom: 1px solid #7c7c7c
}

.wrap_certify .box_select .wrap_inp .item_radio {
	float: left;
	height: 45px
}

.wrap_certify .box_select.box_phone .wrap_inp .item_radio {
	height: 44px
}

.wrap_certify .box_nodata {
	margin: 40px 0;
	padding: 28px;
	text-align: center;
	color: #b2b2b2;
	font-size: 12px;
	border: 1px solid #e5e5e5
}

.wrap_certify .box_nodata .tit_nodata {
	display: block;
	margin-bottom: 2px;
	font-size: 16px;
	color: #929292;
	font-weight: normal
}

.wrap_certify .box_nodata .link_comm {
	line-height: 22px
}

.wrap_certify .box_certify .list_set {
	border-bottom: 1px solid #7c7c7c;
	line-height: 22px
}

.wrap_certify .box_certify .list_set:first-child {
	margin-top: -8px
}

.wrap_certify .box_certify .list_set dt {
	float: left;
	min-width: 144px;
	margin: 11px 0;
	padding-right: 20px;
	font-size: 16px;
	border-right: 1px solid #7c7c7c
}

.wrap_certify .box_certify .list_set dd {
	overflow: hidden;
	padding: 11px 0 11px 20px;
	border: 0;
	font-size: 16px
}

.wrap_certify .box_certify .desc_comm {
	margin-top: 4px
}

.wrap_certify .box_email .tit_manage, .wrap_certify .box_phone .tit_manage
	{
	padding-bottom: 10px
}

.wrap_certify .box_email .wrap_inp, .wrap_certify .box_phone .wrap_inp {
	border-bottom: 1px solid #d4d4d4
}

.wrap_certify .box_email .tit_manage+.wrap_inp, .wrap_certify .box_phone .tit_manage+.wrap_inp
	{
	border-top: 1px solid #1e1e1e
}

.wrap_certify .box_email .item_inp.status_error, .wrap_certify .box_phone .item_inp.status_error
	{
	height: 69px
}

.wrap_certify .box_email .item_inp.status_error .txt_error,
	.wrap_certify .box_phone .item_inp.status_error .txt_error {
	display: block;
	line-height: 7px;
	font-size: 12px
}

.wrap_certify .box_email .item_inp.status_error .ico_error,
	.wrap_certify .box_phone .item_inp.status_error .ico_error {
	margin: -2px 5px 0 32px;
	background-position: -150px -80px
}

.wrap_certify .box_email .email_list, .wrap_certify .box_phone .phone_number_list
	{
	border-top: 1px solid #1e1e1e
}

.wrap_certify .txt_error {
	display: none;
	color: #ff6229
}

.wrap_certify .wrap_more {
	text-align: center;
	padding-top: 30px
}

.wrap_certify .box_password .wrap_inp {
	border-bottom: 1px solid #7c7c7c
}

.wrap_certify .box_password .wrap_inp .tf_g {
	border: 0
}

.wrap_certify .box_password .wrap_inp .btn_g {
	width: auto;
	height: 30px;
	padding: 0 18px;
	font-size: 12px
}

.wrap_certify .box_password .tf_g {
	border-bottom: 1px solid #7c7c7c
}

.wrap_certify .box_password .desc_comm {
	margin-top: 10px
}

.wrap_certify .box_password.box_nodata {
	position: relative;
	font-size: 16px;
	margin-top: 88px
}

.wrap_certify .box_password.box_nodata .tit_manage {
	position: absolute;
	top: -30px;
	left: 0
}

.wrap_certify .box_deactive {
	text-align: center;
	margin-top: 65px;
	padding-bottom: 100px;
	border-bottom: 1px solid #e5e5e5
}

.wrap_certify .box_title {
	padding: 40px 0;
	border-bottom: 1px solid #f5f5f5;
	text-align: center
}

.wrap_certify .box_title .txt_title {
	display: block;
	margin-bottom: 10px;
	font-size: 12px;
	color: #4a4a4a
}

.wrap_certify .box_title .txt_info {
	display: block;
	font-weight: normal;
	font-size: 18px;
	line-height: 24px;
	color: #5066aa
}

.wrap_certify .box_title+.list_info {
	margin-top: 20px
}

.wrap_certify .list_desc {
	line-height: 18px
}

.wrap_certify .list_desc li {
	margin-top: 10px
}

.wrap_certify .wrap_btn6 {
	font-size: 0;
	text-align: center
}

.wrap_certify .link_setting {
	padding-top: 6px
}

.certify_second .link_certify {
	display: inline-block;
	width: 100%;
	margin: 40px auto 0;
	font-size: 12px;
	color: #191919;
	text-align: center;
	text-decoration: underline
}

.certify_second .txt_msg {
	display: block;
	margin-top: 4px
}

.certify_second .wrap_btn5 {
	margin-top: 30px
}

.certify_second .wrap_btn+.link_certify {
	margin-top: 20px
}

.certify_second .box_nodata {
	margin: 40px 0 30px
}

.certify_second .box_certify {
	margin-top: 40px;
	padding: 30px 20px;
	line-height: 18px;
	font-size: 12px;
	color: #b7b7b7;
	background-color: #fafafa;
	text-align: center
}

.certify_second .box_certify .info_address {
	display: block;
	margin-bottom: 10px;
	line-height: 24px;
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕",
		Malgun Gothic, "돋움", dotum, sans-serif;
	font-size: 18px;
	color: #191919
}

.certify_second .box_certify+.item_tf {
	margin-top: 10px
}

.certify_second .box_table {
	padding-right: 20px;
	line-height: 18px;
	font-size: 12px;
	color: #b7b7b7;
	text-align: center
}

.certify_second .box_table .list_myinfo {
	width: 560px;
	border-bottom: 1px solid #d4d4d4;
	color: #252525
}

.certify_second .box_table .list_myinfo:first-child {
	border-top: 1px solid #1e1e1e
}

.certify_second .box_table .list_myinfo dt {
	float: left;
	width: 161px;
	min-width: 144px;
	padding: 13px 0 13px 14px;
	font-size: 16px;
	text-align: left;
	background-color: #fafafa
}

.certify_second .box_table .list_myinfo dd {
	overflow: hidden;
	padding: 13px 0 13px 30px;
	font-size: 16px;
	text-align: left;
	border: 0
}

.certify_second .item_tf {
	position: relative
}

.certify_second .item_tf .btn_g1 {
	position: absolute;
	top: -3px;
	right: 0;
	height: 30px
}

.certify_second .item_tf+.item_tf {
	margin-top: 2px
}

.certify_second .lab_certify {
	color: transparent;
	height: 0
}

.certify_second .lab_certify.lab_placeholder {
	height: auto;
	color: #adadad
}

.certify_second .tf_g {
	padding-right: 93px
}

.certify_second .btn_g {
	margin: 10px auto 0
}

.certify_second .btn_confirm {
	width: 270px;
	font-size: 16px
}

.certify_second .btn_g1 {
	display: block;
	height: 26px;
	padding: 0 11px;
	border-color: #dbdbdb;
	background-color: #fff;
	line-height: 23px;
	font-size: 12px;
	color: #191919
}

.certify_second .certify_nodata {
	margin: 10px 0 0;
	padding: 28px;
	border: 1px solid #e5e5e5;
	font-size: 12px;
	color: #b2b2b2;
	text-align: center
}

.certify_second .certify_nodata .link_comm {
	font-size: 16px;
	text-decoration: none
}

.certify_second .certify_nodata+.wrap_btn5 {
	margin-top: 30px
}

.info_certify {
	margin-top: 40px;
	border: solid #7c7c7c;
	border-width: 1px 0
}

.info_certify .list_myinfo {
	border-top: 1px solid #e5e5e5;
	display: table;
	width: 100%;
	table-layout: fixed
}

.info_certify .list_myinfo:first-child {
	border-top: 0
}

.info_certify .list_myinfo dt {
	display: table-cell;
	width: 147px;
	padding: 10px 14px 9px;
	font-size: 16px;
	line-height: 24px;
	background-color: #fafafa;
	color: #252525
}

.info_certify .list_myinfo dd {
	overflow: hidden;
	width: 270px;
	padding: 10px 85px 9px 30px;
	border-bottom: 0;
	line-height: 24px
}

.info_certify .list_myinfo dd .inner_txt.txt_error {
	display: block;
	position: relative;
	top: -2px;
	padding: 3px 0;
	margin-bottom: -1px;
	line-height: 18px;
	font-size: 12px
}

.info_certify .list_myinfo dd .inner_txt .ico_notice2 {
	margin: 3px 5px 0 0
}

.info_certify .list_myinfo dd .btn_comm {
	width: auto;
	padding: 0 7px
}

.info_certify .list_myinfo dd .btn_type4 {
	margin-top: 2px
}

.info_certify .list_myinfo dd .btn_type7 {
	padding: 8px 0 8px 11px
}

.info_certify.info_device {
	margin-top: 10px
}

.info_certify.info_device .list_myinfo dt {
	width: 141px;
	padding: 10px 14px 9px;
	font-size: 16px;
	line-height: 21px
}

.info_certify.info_device .list_myinfo dd {
	width: 285px;
	padding: 10px 80px 9px 20px;
	line-height: 21px
}

.info_certify.info_device .list_myinfo dd .inner_txt {
	font-size: 14px
}

.info_certify.info_device .list_myinfo .btn_comm {
	padding: 0 11px
}

.info_certify .item_certify {
	display: table;
	width: 100%;
	font-size: 12px;
	line-height: 22px
}

.info_certify .item_certify .tit_device {
	display: table-cell;
	width: 70px;
	padding-right: 20px;
	font-weight: normal
}

.info_certify .item_certify .txt_device {
	display: table-cell;
	color: #929292
}

.info_device .manage_btn {
	top: 10px
}

.box_alert {
	margin-top: 20px;
	padding: 20px;
	font-size: 12px;
	background-color: #fafafa
}

.box_alert .ico_notice2 {
	margin: 2px 6px 2px 0
}

.box_alert .emph_alert {
	color: #4a4a4a
}

.box_alert .txt_alert {
	padding-top: 4px;
	color: #959595
}

.fld_contact .item_tf {
	display: block
}

.box_signout .wrap_agree .item_inp {
	margin-top: 15px
}

.info_cash .info_head {
	height: 20px;
	border-bottom: 1px solid #dbdbdb;
	background-color: transparent
}

.info_cash .info_head .tit_info {
	font-family: NotoSans-Bold, sans-serif;
	font-size: 14px
}

.info_cash .info_head .link_recash {
	font-size: 14px;
	color: #184aac
}

.info_cash .info_body {
	display: table;
	width: 100%;
	padding: 0
}

.info_cash .info_body .list_cash {
	display: table-cell;
	width: 50%;
	border-left: 1px solid #dbdbdb;
	vertical-align: top
}

.info_cash .info_body .list_cash:first-child {
	border-left: 0
}

.info_cash .list_cash {
	padding: 23px 30px 20px 26px;
	font-size: 14px
}

.info_cash .list_cash dt {
	float: left;
	color: #959595
}

.info_cash .list_cash dd {
	float: right;
	font-family: NotoSans-Bold, sans-serif
}

.kakao_layer .inner_certify_layer .layer_body {
	padding-top: 26px
}

.kakao_layer .inner_certify_layer .inp_radio {
	top: 0
}

.kakao_layer .inner_certify_layer .ico_radio {
	margin-top: 0
}

.kakao_layer .inner_certify_layer .item_inp {
	margin: 0 0 8px;
	line-height: 17px;
	height: 31px
}

.kakao_layer .list_ars li {
	margin-bottom: 15px;
	border-top: 1px solid rgba(0, 0, 0, 0.08)
}

.kakao_layer .list_ars li:first-child {
	border-top: 0 none
}

.kakao_layer .list_ars li:last-child {
	padding-bottom: 0
}

.kakao_layer .inner_list_layer {
	max-width: 410px
}

.kakao_layer .inner_list_layer .list_desc {
	margin-top: 20px;
	font-size: 14px;
	line-height: 22px
}

.kakao_layer .inner_list_layer .list_desc li {
	margin-top: 9px
}

.kakao_layer .inner_campaign_layer {
	max-width: 500px;
	padding: 0
}

.kakao_layer .inner_campaign_layer .layer_head {
	height: 339px;
	background:
		url("/assets/weblogin/techin/img_security-a74e43ad9071e55f42cf14517de1aac0c543092ce57a4341fcc65d0dbb7f2461.png")
		104px 100% no-repeat;
	background-color: #f6fbff
}

.kakao_layer .inner_campaign_layer .tit_layer {
	padding-top: 54px;
	font-size: 26px;
	line-height: 36px;
	color: #000;
	opacity: .75;
	text-align: center
}

.kakao_layer .inner_campaign_layer .layer_body {
	padding: 22px 30px 34px;
	word-break: normal
}

.kakao_layer .inner_campaign_layer .txt_layer {
	margin: 0;
	color: #7f7f7f;
	letter-spacing: -0.5px
}

.kakao_layer .inner_campaign_layer .link_more {
	display: inline-block;
	margin-top: 14px;
	border-bottom: 1px solid #000;
	font-size: 14px;
	line-height: 20px;
	color: #191919;
	vertical-align: top;
	text-decoration: none
}

.kakao_layer .inner_campaign_layer .wrap_btn .btn_g {
	width: 160px;
	height: 44px;
	margin: 0 auto
}

.layer_myinfo .inner_myinfo_layer {
	max-width: 420px
}

.layer_myinfo .inner_myinfo_layer .link_account {
	display: inline-block;
	margin-top: 4px;
	vertical-align: top;
	color: #4f66aa;
	text-decoration: underline
}

.layer_myinfo .inner_myinfo_layer .fld_agree {
	margin-top: 30px;
	padding: 3px 14px 25px 14px;
	background-color: #fafafa;
	box-sizing: border-box
}

.layer_myinfo .inner_myinfo_layer .fld_agree .item_check {
	padding-right: 60px
}

.layer_myinfo .inner_myinfo_layer .fld_agree .lab_check .txt_checkall {
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, '맑은 고딕',
		Malgun Gothic, '돋움', dotum, sans-serif
}

.layer_myinfo .inner_myinfo_layer .fld_agree .link_more {
	top: -2px;
	min-height: 26px;
	padding: 0 13px;
	border: 1px solid #adadad;
	border-radius: 15px;
	text-decoration: none;
	font-size: 12px;
	line-height: 25px
}

.layer_myinfo .inner_myinfo_layer .fld_email2 .tf_required {
	margin-top: 20px;
	color: #252525
}

.layer_myinfo .inner_myinfo_layer .fld_email2 .lab_g {
	font-size: 16px
}

.layer_myinfo .inner_myinfo_layer .fld_email2 .tf_g {
	border-bottom-width: 1px
}

.layer_myinfo .inner_myinfo_layer2 {
	max-width: 440px
}

.layer_myinfo .inner_myinfo_layer2 .layer_body .txt_layer {
	line-height: 20px;
	color: #606060
}

.layer_myinfo .inner_myinfo_layer2 .layer_body .link_account {
	display: block;
	margin-top: 6px;
	vertical-align: top;
	color: #5066aa;
	text-decoration: underline
}

.layer_myinfo .inner_myinfo_layer2 .fld_agree {
	margin-top: 20px;
	padding-top: 18px;
	border-top: 1px solid #dfdfdf
}

.layer_myinfo .inner_myinfo_layer2 .fld_agree .link_more .ico_arr {
	margin: 4px 4px 3px 5px
}

.layer_myinfo .inner_myinfo_layer2 .fld_email2 .tf_required {
	margin-top: 20px;
	color: #252525
}

.layer_myinfo .inner_myinfo_layer2 .fld_email2 .lab_g {
	font-size: 16px
}

.layer_myinfo .inner_myinfo_layer2 .fld_email2 .tf_g {
	border-bottom-width: 1px
}

.layer_myinfo .inner_myinfo_layer3 {
	max-width: 430px
}

.layer_myinfo .inner_myinfo_layer3 .wrap_btn2 {
	margin-top: 30px
}

.layer_myinfo .inner_myinfo_layer3 .wrap_btn2 .btn_g {
	margin-top: 0;
	float: left;
	width: 180px;
	height: 50px
}

.layer_myinfo .inner_myinfo_layer3 .wrap_btn2 .btn_g+.btn_g {
	margin-left: 10px
}

.layer_myinfo .inner_myinfo_layer3 .wrap_btn2:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.layer_alert .inner_kakao_layer {
	width: 440px;
	max-width: none
}

.layer_alert .inner_kakao_layer .fld_agree .item_check .ico_check {
	margin-top: 2px
}

.layer_alert .inner_kakao_layer .fld_agree .item_check .txt_check {
	font-size: 17px;
	line-height: 24px
}

.layer_alert .inner_kakao_layer .fld_agree .item_check .link_more {
	top: 2px
}

.bundle_profile {
	margin-top: 40px
}

.bundle_profile:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.bundle_profile .wrap_profile {
	float: left;
	position: relative;
	width: 66px;
	height: 66px;
	margin-right: 34px
}

.bundle_profile .info_profile {
	overflow: hidden;
	margin-bottom: -30px;
	padding-bottom: 30px
}

.bundle_profile .info_profile .tf_required {
	margin-top: 0
}

.bundle_profile .btn_photo {
	position: absolute;
	bottom: 0;
	right: -17px;
	z-index: 10;
	margin-left: 15px
}

.bundle_profile .btn_photo .ico_photo {
	width: 34px;
	height: 34px;
	background-position: -30px -60px
}

.bundle_profile .item_select .list_select {
	top: 10px
}

.bundle_profile .info_error {
	margin-bottom: -30px
}

.layer_manage .inner_kakao_layer {
	max-width: 520px;
	padding: 40px 70px 50px
}

.layer_manage .inner_kakao_layer .info_agree {
	margin-top: 10px
}

.layer_manage .inner_kakao_layer .info_agree .link_more {
	display: inline-block;
	margin-top: 10px
}

.layer_manage .inner_kakao_layer .info_profile {
	margin-bottom: 0;
	padding-bottom: 0
}

.layer_manage .inner_kakao_layer .info_profile .item_tf {
	height: 45px
}

.layer_manage .inner_kakao_layer .info_profile .tf_required {
	margin-top: 5px
}

.layer_manage .inner_kakao_layer .tf_required {
	margin-top: 0;
	color: #4a4a4a
}

.layer_manage .inner_kakao_layer .type_birth .select_year {
	width: 113px
}

.layer_manage .inner_kakao_layer .type_birth .select_month {
	width: 87px
}

.layer_manage .inner_kakao_layer .type_birth .wrap_check {
	margin-top: 10px
}

.layer_manage .inner_kakao_layer .bundle_profile+.info_birth_gender {
	margin-top: 14px
}

.layer_manage .inner_kakao_layer .info_error {
	margin-bottom: -30px
}

.layer_manage .inner_manage_layer .tit_layer {
	display: block;
	padding-top: 24px;
	font-size: 24px
}

.layer_manage .inner_manage_layer2 {
	max-width: 520px;
	padding: 40px
}

.layer_manage .inner_manage_layer2 .info_count {
	font-size: 14px
}

.layer_manage .inner_manage_layer2 .item_tf .tf_g {
	height: 46PX
}

.layer_manage .inner_manage_layer2 .item_tf.type_error {
	height: 76px
}

.type_birth .wrap_check {
	float: right
}

.type_birth .wrap_check .item_check {
	float: left
}

.type_birth .wrap_check .item_check+.item_check {
	margin-left: 20px
}

.search_address {
	position: relative
}

.search_address .iframe_g {
	display: block;
	width: 100%;
	border: 0 none
}

.search_address .btn_close {
	position: absolute;
	top: 22px;
	right: 20px;
	padding: 6px;
	background-color: #fff
}

.search_address .btn_close .ico_close {
	display: block;
	width: 18px;
	height: 18px;
	background-position: -70px -60px
}

.cont_state .wrap_tbl {
	margin-top: 40px
}

.wrap_connectedservice {
	padding-bottom: 60px
}

.wrap_connectedservice .info_external {
	margin: 0 auto;
	text-align: center
}

.wrap_connectedservice .info_external .thumb_info {
	margin: 40px auto 0;
	width: 90px;
	height: 90px;
	border-radius: 4px;
	overflow: hidden
}

.wrap_connectedservice .info_external .img_info {
	width: 100%;
	vertical-align: top
}

.wrap_connectedservice .info_external .tit_info {
	display: block;
	margin-top: 20px;
	color: #252525;
	font-size: 16px;
	font-weight: normal
}

.wrap_connectedservice .info_external .txt_info {
	margin-top: 10px;
	color: #959595;
	font-size: 12px
}

.wrap_connectedservice .wrap_tbl .tbl_type1 {
	border-top: 0 none
}

.wrap_connectedservice .wrap_tbl tr:first-child th,
	.wrap_connectedservice .wrap_tbl tr:first-child td {
	border-top: 1px solid #1e1e1e
}

.wrap_connectedservice .wrap_tbl th {
	padding-left: 20px;
	text-align: left;
	vertical-align: top;
	border-bottom: 1px solid #d4d4d4
}

.wrap_connectedservice .wrap_tbl td {
	position: relative;
	padding: 10px 0 11px 20px;
	font-size: 16px;
	border-width: 1px 0 0 0
}

.wrap_connectedservice .wrap_tbl td .wrap_btn {
	position: absolute;
	top: 0;
	right: 0
}

.wrap_connectedservice .wrap_tbl td>.wrap_btn {
	top: 10px
}

.wrap_connectedservice .wrap_tbl .cell_bundle {
	position: relative;
	padding-right: 180px
}

.wrap_connectedservice .wrap_tbl .list_innertbl li {
	position: relative;
	line-height: 26px;
	margin-top: 2px;
	padding-right: 80px
}

.wrap_connectedservice .wrap_tbl .list_innertbl li+li {
	margin-top: 6px
}

.wrap_connectedservice .wrap_tbl .btn_comm {
	float: left;
	display: block;
	min-width: 70px;
	margin-left: 9px;
	padding: 4px 12px;
	font-size: 12px;
	line-height: normal;
	text-align: center;
	border: 1px solid #e0e0e0;
	box-sizing: border-box
}

.wrap_connectedservice .wrap_btn .btn_externallist {
	width: 270px;
	margin: 40px auto 0
}

.cont_authentic .fld_g {
	margin-top: 58px
}

.cont_authentic .fld_g .item_check {
	margin-top: 27px
}

.cont_authentic .fld_number {
	margin-top: 78px
}

.cont_authentic .wrap_radio {
	margin-top: -10px;
	padding-bottom: 5px;
	border-bottom: 2px solid rgba(0, 0, 0, 0.07)
}

.cont_authentic .wrap_radio .item_radio {
	float: left
}

.cont_authentic .item_radio {
	line-height: 45px
}

.cont_authentic .item_radio .lab_g {
	display: inline-block
}

.cont_authentic .lab_radio .txt_radio {
	font-size: 16px
}

.cont_authentic .type_phone {
	margin-top: 12px
}

.cont_authentic .wrap_tooltip {
	float: right;
	margin: 13px 0 0 8px;
	line-height: 0
}

.cont_authentic .desc_notice {
	position: relative;
	margin-top: 16px;
	padding-left: 20px;
	font-size: 13px;
	line-height: 20px;
	color: rgba(0, 0, 0, 0.4);
	word-break: keep-all
}

.cont_authentic .desc_notice .ico_account {
	position: absolute;
	left: 0;
	top: 0;
	margin: 2px 4px 0 0
}

.cont_authentic .desc_notice .link_comm {
	margin-left: 4px
}

.cont_authentic .link_change {
	color: rgba(0, 0, 0, 0.4)
}

.wrap_setting {
	margin-top: 30px;
	padding: 20px 0;
	border-top: 1px solid rgba(0, 0, 0, 0.08);
	border-bottom: 1px solid rgba(0, 0, 0, 0.08)
}

.wrap_setting .list_set {
	line-height: 40px
}

.wrap_setting .list_set:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.wrap_setting .list_set dt {
	float: left;
	width: 105px;
	height: 40px;
	font-size: 14px;
	color: #767676
}

.wrap_setting .list_set dd {
	float: left;
	width: calc(100% - 105px);
	font-size: 14px;
	color: #191919
}

.wrap_setting .list_set .btn_change {
	margin-left: 10px
}

.cont_third #mArticle {
	max-width: 520px;
	padding: 58px 40px 139px 40px
}

.cont_third .desc_form {
	margin: -29px 0 40px
}

.cont_third .info_account .btn_photo {
	top: 38px;
	margin-left: 6px
}

.cont_third .fld_apply .info_account {
	margin: 50px 0 -10px
}

.cont_third .fld_apply .tf_g {
	font-family: NotoSans-Bold, sans-serif
}

.cont_third .fld_apply .tf_email {
	padding-right: 40px;
	font-size: 16px
}

.cont_third .fld_apply .tf_address {
	padding-right: 100px;
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕",
		Malgun Gothic, "돋움", dotum, sans-serif
}

.cont_third .fld_apply .wrap_btn2 .btn_g {
	height: 35px;
	padding: 0 16px;
	font-size: 14px
}

.cont_third .fld_apply .info_done {
	margin-top: 10px;
	color: #7c7c7c;
	font-size: 13px
}

.cont_third .item_suggest .list_select {
	position: static;
	display: block
}

.cont_third .type_phone {
	display: table;
	table-layout: fixed;
	width: 100%;
	padding-left: 0;
	border-bottom: 0;
	margin: 10px 0
}

.cont_third .type_phone .item_tf {
	display: table-cell
}

.cont_third .type_phone .item_tf .tf_g {
	padding: 0;
	border-width: 0 0 2px 0
}

.cont_third .type_phone .item_tf:before {
	display: none
}

.cont_third .type_phone .item_tf .lab_placeholder {
	padding-left: 0
}

.cont_third .type_phone:after {
	display: none
}

.cont_third .type_phone .txt_dash {
	display: table-cell;
	width: 35px;
	text-align: center
}

.cont_third .type_birth {
	display: table;
	table-layout: fixed;
	width: 100%
}

.cont_third .type_birth.on {
	border-color: #7c7c7c
}

.cont_third .type_birth .item_inp {
	display: table-cell;
	width: auto;
	float: none
}

.cont_third .type_birth .link_selected .ico_arr {
	position: static
}

.cont_third .type_birth .select_month {
	text-align: center
}

.cont_third .type_birth .select_month .list_select {
	left: 50%;
	margin-left: -45px;
	text-align: left
}

.cont_third .type_birth .select_day {
	text-align: right
}

.cont_third .type_birth .select_day .list_select {
	right: 0;
	min-width: 90px;
	text-align: left
}

.cont_third .type_birth:after {
	display: none
}

.cont_third .type_error {
	border-color: #e65f3e !important
}

.cont_third .type_gender .item_inp {
	width: 50%
}

.cont_third .wrap_zipcode {
	position: relative;
	border: 1px solid #eee;
	border-radius: 2px;
	background-color: #fff;
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2)
}

.cont_third .wrap_zipcode .tit_zipcode {
	display: block;
	height: 65px;
	padding-left: 22px;
	font-size: 16px;
	color: #252525;
	line-height: 65px
}

.cont_third .wrap_zipcode iframe {
	vertical-align: top
}

.cont_third .wrap_zipcode .btn_close {
	position: absolute;
	top: 0;
	right: 0;
	padding: 15px
}

.cont_third .wrap_zipcode .btn_close .ico_close {
	display: block;
	width: 18px;
	height: 18px;
	background-position: -70px -60px
}

.cont_third .wrap_btn3 {
	left: 40px;
	right: 40px
}

.account_policy {
	overflow: auto;
	min-width: 420px;
	padding: 50px;
	color: #252525
}

.account_policy .cont_third #mArticle {
	max-width: 100%;
	padding: 0
}

.account_policy .tit_policy {
	display: block;
	font-size: 24px
}

.account_policy .desc_policy {
	margin: 11px 0 31px;
	color: #7c7c7c
}

.account_policy .tit_subpolicy {
	display: block;
	margin: 27px 0 11px;
	font-size: 18px;
	font-weight: 600
}

.account_policy .wrap_tbl {
	margin: 0 0 40px 0
}

.account_policy .wrap_tbl .tbl_g {
	margin: 0;
	border-right: 1px solid #e7e7e7;
	border-color: #e7e7e7
}

.account_policy .wrap_tbl .tbl_g th {
	padding: 17px 0 19px;
	color: #666;
	font-weight: normal;
	border-color: #e7e7e7
}

.account_policy .wrap_tbl .tbl_g td {
	padding: 25px 25px 27px;
	vertical-align: top;
	border-color: #e7e7e7
}

.account_policy .wrap_tbl .desc_table {
	font-size: 14px;
	color: #666
}

.layer_select .item_select .list_select {
	top: 350px;
	left: 50%;
	display: block;
	margin-left: -82px;
	padding: 3px 0;
	font-size: 13px;
	text-align: left
}

.thumb_identity .ico_normal {
	width: 80px;
	height: 80px;
	background-position: 0 -20px
}

.thumb_identity .ico_notice3 {
	width: 14px;
	height: 14px;
	background-position: -40px 0
}

.cont_third #mArticle {
	min-height: 510px
}

.cont_third .fld_agree {
	margin-top: 18px
}

.cont_third .wrap_identity {
	padding: 0 30px
}

.cont_third .wrap_identity+.wrap_btn3 {
	padding: 0 30px
}

.cont_third .wrap_identity .fld_agree {
	margin-top: 13px
}

.cont_third .wrap_identity .fld_agree .desc_check2 {
	padding-bottom: 18px
}

.info_identity {
	padding-top: 21px;
	text-align: center
}

.info_identity .ico_error {
	width: 80px;
	height: 80px;
	background-position: -270px -20px
}

.info_identity .thumb_identity {
	display: block;
	width: 80px;
	height: 80px;
	margin: 0 auto
}

.info_identity .thumb_identity .txt_age {
	display: block;
	width: 100%;
	height: 100%;
	border: 2px solid #e5e5e5;
	border-radius: 50%;
	font-family: -apple-system, system-ui, BlinkMacSystemFont,
		NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕", Malgun Gothic,
		"돋움", dotum, sans-serif;
	font-size: 40px;
	color: #e65f3e;
	line-height: 74px;
	font-weight: 200;
	box-sizing: border-box
}

.info_identity .thumb_identity .txt_age19 {
	border-color: #e65f3e
}

.info_identity .tit_identity {
	display: block;
	margin-top: 30px;
	font-weight: normal;
	font-size: 18px;
	line-height: 24px;
	color: #333;
	text-align: center
}

.info_identity .desc_notice {
	margin-top: 10px;
	font-size: 14px;
	line-height: 20px;
	color: #5066aa
}

.info_identity .ico_notice3 {
	width: 14px;
	height: 14px;
	margin: 3px 5px 0 0;
	background-position: -40px 0
}

.info_identity .desc_identity {
	margin-top: 11px;
	font-size: 14px;
	line-height: 22px
}

.info_identity2 {
	position: absolute;
	top: 50%;
	left: 0;
	right: 0;
	height: 200px;
	margin-top: -100px;
	padding-top: 0
}

.box_telecom {
	margin-top: 20px;
	font-size: 0;
	line-height: 0
}

.box_telecom .btn_g {
	width: 100%;
	height: 50px;
	margin-top: 10px;
	border-color: rgba(25, 25, 25, 0.14);
	border-radius: 4px;
	font-size: 15px
}

.box_telecom.box_twins .btn_g {
	width: calc(50% - 5px);
	margin-top: 10px;
	padding: 0
}

.box_telecom.box_twins .btn_g+.btn_g:nth-child(2n) {
	margin-left: 10px
}

@media only screen and (max-width:520px) , only screen and
	(min-device-width:320px) and (max-device-width:900px) {
	.cont_third .tit_step {
		margin-top: 40px
	}
	.cont_third .item_suggest {
		max-width: calc(100vw - 40px)
	}
	.cont_third .wrap_identity {
		margin-top: 40px;
		padding: 0
	}
	.cont_third .wrap_identity .info_identity {
		padding-top: 0
	}
	.cont_third .wrap_identity .info_identity .thumb_identity {
		margin-top: 13px
	}
	.cont_third .wrap_identity .info_identity2 {
		position: static;
		margin-top: 0
	}
	.cont_third .wrap_identity+.wrap_btn3 {
		padding: 0
	}
	.account_comm .cont_third #mArticle {
		min-height: auto;
		padding: 0 40px
	}
	.cont_third .fld_apply .wrap_btn2 .btn_g {
		float: right
	}
	.cont_third .wrap_btn3 {
		position: static;
		margin-top: 40px
	}
	.layer_select .item_select .list_select {
		top: 300px
	}
}

@media only screen and (min-device-width:320px) and
	(max-device-width:900px) and (orientation:landscape) {
	.account_comm.account_third #kakaoWrap {
		padding: 40px 0 0
	}
	.account_comm.account_third .cont_third #mArticle {
		max-width: 100%;
		min-height: auto;
		margin: 0;
		border: 0
	}
	.account_comm.account_third .wrap_identity {
		overflow: hidden;
		margin-top: 11px
	}
	.account_comm.account_third .wrap_identity .identity_error .thumb_identity
		{
		margin-top: 31px
	}
	.account_comm.account_third .fld_agree {
		margin-top: -17px
	}
	.account_comm.account_third .info_identity {
		float: left;
		width: 50%;
		padding-top: 0
	}
	.account_comm.account_third .info_identity+form {
		float: left;
		width: 50%
	}
	.account_comm.account_third .info_identity .tit_identity {
		max-width: 250px;
		margin: 14px auto 0
	}
	.account_comm.account_third .info_identity .desc_notice {
		margin-top: 15px
	}
	.account_comm.account_third .info_identity .desc_identity {
		max-width: 235px;
		margin: 5px auto 0
	}
	.account_comm.account_third .identity_error {
		float: right;
		margin: 26px 10px 16px 0
	}
	.account_comm.account_third .identity_error .tit_identity {
		margin-top: 0
	}
	.account_comm.account_third .identity_error .desc_identity {
		margin-top: 10px
	}
	.account_comm.account_third .identity_error .thumb_identity {
		position: absolute;
		top: 24px;
		left: 25%;
		margin-left: -40px
	}
	.account_comm.account_third .info_identity2 {
		height: auto;
		min-height: 160px;
		min-height: 20vh;
		margin-top: 0
	}
	.account_comm.account_third .info_identity2 .thumb_identity {
		top: 0
	}
	.account_comm.account_third .wrap_btn3 {
		position: static;
		margin-top: 36px
	}
	.account_comm.account_third #kakaoFoot {
		margin-top: 40px;
		padding-bottom: 15px
	}
}

@media only screen and (min-device-width:320px) and
	(max-device-width:600px) and (orientation:landscape) {
	.cont_third .wrap_identity .info_identity {
		padding-right: 10px;
		box-sizing: border-box
	}
	.cont_third .wrap_identity .identity_error {
		padding-right: 0
	}
	.account_third .info_identity+form {
		padding-left: 10px;
		box-sizing: border-box
	}
}

.img_login {
	overflow: hidden;
	display: inline-block;
	line-height: 0;
	font-size: 0;
	background:
		url("/assets/weblogin/techin/img_login-fecd757193ae46a90b8148811cac49d25e786dc0092e977a5956b9c225e0b38f.png");
	vertical-align: top;
	text-indent: -9999px;
	width: 80px;
	height: 80px
}

.img_tms {
	background-position: 0 0
}

.img_stop {
	background-position: -90px 0
}

.img_rock {
	background-position: -180px 0
}

.img_protect {
	background-position: -270px 0
}

.img_check {
	background-position: -360px 0
}

.img_find {
	display: block;
	max-width: 100%;
	margin: 30px auto 0
}

.ico_loading {
	width: 41px;
	height: 41px;
	background-position: -140px -140px;
	-webkit-animation: rotate 2s linear infinite;
	animation: rotate 2s linear infinite
}

.ico_qr {
	width: 16px;
	height: 16px;
	background-position: -80px -200px;
	margin: 4px 7px 0 0
}

.ico_qrsmall {
	width: 15px;
	height: 15px;
	background-position: -100px -200px;
	margin: 2px 1px 0 0
}

.ico_reset {
	display: block;
	width: 20px;
	height: 19px;
	background-position: -120px -200px
}

.item_switch .inp_swtich {
	width: 48px;
	height: 27px
}

.item_switch .lab_switch .ico_account {
	display: block;
	width: 48px;
	height: 27px;
	background-position: -150px -220px
}

.item_switch.item_on .lab_switch .ico_account {
	background-position: -150px -190px
}

@
-webkit-keyframes rotate {
	from {transform: rotate(0)
}

to {
	transform: rotate(360deg)
}

}
@
keyframes rotate {
	from {transform: rotate(0)
}

to {
	transform: rotate(360deg)
}

}
.ico_help {
	display: block;
	width: 20px;
	height: 20px;
	background-position: 0 -140px
}

.tooltip_comm {
	display: none;
	position: absolute;
	z-index: 10;
	width: 280px;
	padding: 7px 12px 8px;
	border-radius: 3px;
	font-size: 12px;
	color: #fff;
	text-align: left;
	background-color: rgba(0, 0, 0, 0.8);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorStr=#cc000000,endColorStr=#cc000000)";
	box-sizing: border-box;
	word-break: keep-all
}

.tooltip_comm .ico_arr {
	position: absolute;
	top: -7px;
	left: 10px;
	width: 15px;
	height: 7px;
	background-position: -120px -140px
}

.tooltip_comm .link_more {
	display: inline-block;
	position: relative;
	top: auto;
	right: auto;
	margin-top: 10px;
	font-size: 12px;
	vertical-align: top;
	color: #fbdd0d
}

.tooltip_comm .txt_tooltip .link_more {
	margin-top: 0
}

.tooltip_on .tooltip_comm {
	display: block
}

.tooltip_login {
	top: 36px
}

.tooltip_login .ico_arr {
	left: 63px
}

.util_tf .tooltip_comm {
	top: 43px;
	left: auto;
	right: -4px
}

.util_tf .tooltip_comm .ico_arr {
	left: auto;
	right: 7px
}

.login_type1 #mArticle {
	max-width: 520px
}

.login_type1 a {
	color: rgba(0, 0, 0, 0.7)
}

.login_type2 {
	background-color: #4c515d
}

.login_type2 #kakaoServiceLogo {
	background: transparent
}

.login_type2 #kakaoServiceLogo .img_logo {
	vertical-align: top
}

.login_type2 #kakaoHead {
	position: absolute;
	left: 20px;
	top: 20px;
	z-index: 10;
	max-width: none
}

.login_type2 #kakaoFoot {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	padding-bottom: 20px
}

.login_type2 #mArticle {
	max-width: 520px;
	border-color: transparent
}

.login_type2 .bg_login {
	overflow: hidden;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -1
}

.login_type2 a {
	color: #fff
}

.login_type2 .ico_help {
	background-position: -30px -140px
}

.login_type2 .tit_page {
	color: #fff
}

.login_type2 .tf_g {
	color: #fff;
	background-color: transparent
}

.login_type2 .lab_g {
	color: #fff
}

.login_type2 .lab_check .ico_check {
	background-position: -90px -140px
}

.login_type2 .lab_check .txt_check {
	color: #fff
}

.login_type2 .item_select .link_selected .ico_arr {
	background-position: 0 -170px
}

.login_type2 .item_tf .tf_g {
	border-color: #fff;
	border-color: rgba(255, 255, 255, 0.4)
}

.login_type2 .item_tf .tf_g:focus {
	border-color: #fff
}

.login_type2 .item_on .lab_check .ico_check {
	background-position: 0 -30px
}

.login_type2 .util_tf .btn_del .ico_del {
	background-position: -60px -140px
}

.login_type2 .footer_comm .link_info {
	color: #fff
}

.login_type2 .footer_comm .txt_copyright {
	color: #fff
}

.login_type2 .footer_comm .item_select .link_selected .ico_arr {
	background-position: -10px -60px
}

.login_type2 .cont_login .box_desc {
	background-color: rgba(0, 0, 0, 0.8);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorStr=#cc000000,endColorStr=#cc000000)"
}

.login_type2 .cont_login .box_desc .desc_error {
	color: #fff
}

.login_type2 .cont_login .box_desc .desc_info {
	color: #fff
}

.login_type2 .cont_login .box_desc .link_more {
	color: #fff
}

.login_type2 .line_or:before, .login_type2 .line_or:after {
	background-color: rgba(255, 255, 255, 0.22)
}

.login_type2 .line_or .txt_or {
	color: rgba(255, 255, 255, 0.8)
}

.login_type3 #kakaoServiceLogo {
	margin: 0 0 30px 0
}

.login_type3 #mArticle {
	max-width: 100%;
	margin-top: 0;
	border: 0
}

.login_type3 .login_banner {
	text-align: center;
	font-size: 0
}

.login_type3 .wrap_banner {
	display: inline-block;
	position: relative;
	width: 540px;
	height: 402px;
	margin: 37px 40px 0 0;
	vertical-align: top;
	text-align: left;
	font-size: 16px
}

.login_type3 .wrap_banner .info_banner {
	position: relative;
	z-index: 10;
	padding: 16px 9px
}

.login_type3 .wrap_banner .tit_banner {
	font-weight: normal;
	font-size: 25px;
	line-height: 32px;
	color: #252525
}

.login_type3 .wrap_banner .desc_banner {
	margin-top: 5px;
	font-size: 13px;
	line-height: 18px
}

.login_type3 .wrap_banner .desc_tip {
	margin-top: 8px;
	font-size: 11px;
	line-height: 18px;
	text-align: left
}

.login_type3 .wrap_banner .img_banner {
	width: 540px
}

.login_type3 .wrap_form {
	display: inline-block;
	vertical-align: top;
	text-align: left;
	width: 100%;
	max-width: 480px;
	padding: 60px 70px;
	font-size: 16px;
	box-sizing: border-box;
	border: 1px solid #e5e5e5
}

.login_type3 .footer_comm {
	padding: 20px 0 60px;
	border-top: 1px solid #e5e5e5
}

.login_type3 a {
	color: rgba(0, 0, 0, 0.7)
}

.login_type4 #mArticle {
	max-width: 520px
}

.login_type4 a {
	color: rgba(0, 0, 0, 0.7)
}

.cont_login #mArticle {
	min-height: 545px;
	padding: 59px 69px 49px
}

.cont_login .tit_intro {
	display: block;
	margin-bottom: 30px
}

.cont_login .tit_intro .img_intro {
	max-width: 100%;
	vertical-align: top
}

.cont_login .tit_page {
	padding-top: 0;
	margin-bottom: 50px
}

.cont_login .tit_step {
	margin-bottom: 20px
}

.cont_login .tit_choice {
	display: block;
	font-size: 24px;
	line-height: 34px;
	text-align: center;
	color: #252525
}

.cont_login .tit_certify {
	display: block;
	font-weight: normal;
	font-size: 24px;
	line-height: 34px;
	color: #191919;
	letter-spacing: -1px
}

.cont_login .txt_certify {
	line-height: 26px
}

.cont_login .set_login {
	margin-top: 25px
}

.cont_login .box_desc {
	margin-top: 20px;
	padding: 20px;
	font-size: 13px;
	line-height: 20px;
	background-color: #fafafa
}

.cont_login .box_desc .desc_error {
	color: #e65f32
}

.cont_login .box_desc .desc_info {
	margin-top: 15px
}

.cont_login .box_desc .link_more {
	font-family: NotoSans-Bold, sans-serif;
	color: #7c7c7c;
	text-decoration: underline
}

.cont_login .box_desc2 {
	margin-top: 15px;
	padding: 9px 20px 10px
}

.cont_login .box_desc3 {
	font-size: 12px;
	line-height: 1.5
}

.cont_login .wrap_btn {
	margin-top: 40px
}

.cont_login .info_user {
	margin-top: 30px
}

.cont_login .wrap_captcha {
	margin-top: 18px
}

.cont_login .fld_agree {
	margin-top: 20px
}

.cont_login .fld_agree .wrap_btn {
	margin-top: 40px
}

.cont_login .tf_required {
	color: #4c4c4c
}

.cont_login .wrap_btn .btn_confirm:hover {
	background-color: #fee500
}

.cont_login .wrap_btn .btn_confirm:active {
	background-color: #f0d700
}

.cont_login .wrap_btn .btn_confirm[disabled="disabled"]:hover,
	.cont_login .wrap_btn .btn_confirm[disabled="disabled"]:active {
	background-color: #f7f7f7
}

.fld_login .type_phone+.item_tf {
	margin-top: 10px
}

.set_login:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.set_login .item_check {
	float: left;
	padding-right: 0
}

.set_login .inp_check {
	top: 0
}

.set_login .lab_check .ico_check {
	margin: 0 8px 0 0
}

.set_login .lab_check .txt_check {
	font-size: 14px;
	line-height: 20px
}

.set_login .item_security {
	float: right
}

.set_login .link_security {
	float: left;
	margin-right: 8px;
	font-size: 14px;
	line-height: 20px
}

.set_login .inp_security {
	left: auto;
	right: 0;
	width: 25px
}

.set_login .lab_security {
	min-width: 25px;
	font-size: 14px;
	line-height: 20px
}

.set_login .item_on .lab_security {
	color: #f7be17
}

.info_user:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.info_user .link_join {
	float: left;
	font-size: 12px
}

.info_user .list_user {
	float: right
}

.info_user .list_user li {
	float: left
}

.info_user .list_user li:before {
	content: '';
	float: left;
	width: 1px;
	height: 10px;
	margin: 4px 10px;
	background-color: #e5e5e5
}

.info_user .list_user li:first-child:before {
	display: none
}

.info_user .list_user .link_user {
	float: left;
	font-size: 12px
}

.info_another {
	margin-top: 22px;
	text-align: center
}

.wrap_login {
	text-align: center
}

.wrap_login .thumb_login {
	display: block;
	width: 80px;
	height: 80px;
	margin: 0 auto
}

.wrap_login .tit_login {
	display: block;
	margin-top: 38px;
	font-family: NotoSans-Bold, sans-serif;
	font-size: 24px;
	line-height: 34px;
	color: #5066aa
}

.wrap_login .desc_login {
	margin: 30px -2px 0
}

.wrap_login .desc_login2 {
	margin-top: 30px;
	font-family: NotoSans-Bold, sans-serif;
	color: #333
}

.wrap_login .desc_login3 {
	margin-top: 10px;
	font-size: 14px
}

.wrap_login .wrap_btn {
	margin-top: 50px
}

.wrap_login .link_more {
	display: inline-block;
	margin-top: 20px;
	font-size: 14px;
	text-decoration: underline
}

.wrap_login .ico_loading {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -60px;
	margin-left: -20px
}

.wrap_login .wrap_tbl {
	margin-top: 40px
}

.wrap_login .wrap_tbl .tbl_g {
	margin-left: 0;
	border-color: #ebebeb
}

.wrap_login .wrap_tbl .tbl_g th, .wrap_login .wrap_tbl .tbl_g td {
	padding: 5px 19px 6px;
	border-color: #ebebeb;
	font-size: 12px;
	text-align: left
}

.wrap_login .wrap_tbl .tbl_g td {
	border-width: 1px 1px 0 0
}

.wrap_reset {
	margin-top: 20px
}

.wrap_reset .list_desc {
	padding-top: 10px;
	margin-top: 34px;
	border-top: 1px solid rgba(0, 0, 0, 0.08)
}

.wrap_reset .list_desc li {
	margin-top: 10px
}

.info_choice {
	margin-top: 60px;
	margin-bottom: 0
}

.service_choice {
	margin-top: 41px;
	text-align: left
}

.service_choice .txt_choice {
	margin: 30px 0 10px;
	font-size: 12px;
	color: #7c7c7c
}

.service_choice .link_choice {
	display: block;
	height: 52px;
	line-height: 52px;
	text-align: center;
	border: 1px solid #d3d3d3;
	border-radius: 2px;
	font-size: 16px;
	color: #252525
}

.login_certify {
	margin-top: 20px
}

.login_certify .box_certify {
	margin-top: 30px;
	padding: 30px 20px;
	font-size: 12px;
	line-height: 18px;
	text-align: center;
	background-color: #fafafa;
	color: #b7b7b7
}

.login_certify .box_certify .info_address {
	display: block;
	margin-bottom: 10px;
	color: #191919;
	font-family: NotoSans-Bold, sans-serif;
	font-size: 18px;
	line-height: 24px
}

.login_certify .box_certify .btn_g {
	margin: 10px auto 0
}

.login_certify .box_certify+.link_certify {
	margin-top: 40px
}

.login_certify .btn_g1 {
	display: block;
	height: 25px;
	padding: 0 11px;
	border-color: #ccc;
	font-size: 12px;
	line-height: 23px;
	color: #323232
}

.login_certify .item_tf {
	position: relative;
	margin-top: 10px
}

.login_certify .item_tf .tf_g:focus {
	border-color: #191919
}

.login_certify .item_tf .lab_placeholder {
	font-size: 16px;
	color: #ccc
}

.login_certify .item_tf .btn_g1 {
	position: absolute;
	right: 0;
	top: 11px
}

.login_certify .item_check {
	padding: 0;
	margin-top: 20px
}

.login_certify .wrap_btn {
	margin-top: 40px
}

.login_certify .link_certify {
	display: inline-block;
	width: 100%;
	margin: 20px auto 0;
	text-decoration: underline;
	font-size: 12px;
	text-align: center;
	color: #191919
}

.box_ci {
	margin-top: 10px;
	padding: 20px;
	background-color: #fafafa
}

.box_ci .list_ci {
	overflow: hidden
}

.box_ci .list_ci .item_ci {
	margin-top: 30px
}

.box_ci .list_ci .item_ci:first-child {
	margin-top: 0
}

.box_ci .list_ci dt {
	float: left;
	width: 70px;
	padding-right: 15px;
	font-size: 11px;
	line-height: 25px
}

.box_ci .list_ci dd {
	overflow: hidden;
	font-size: 14px;
	line-height: 20px;
	color: #000
}

.box_ci .list_ci .info_ci {
	display: block;
	margin-top: 3px;
	color: #7c7c7c
}

.desc_ci {
	margin: 15px 0 30px;
	font-size: 13px
}

.line_or {
	position: relative;
	display: block;
	width: 100%;
	padding: 15px 0;
	font-size: 0;
	line-height: 0
}

.line_or:before, .line_or:after {
	display: inline-block;
	width: calc(50% - 20px);
	height: 1px;
	margin: 8px 0;
	background-color: rgba(0, 0, 0, 0.06);
	vertical-align: top;
	content: ''
}

.line_or .txt_or {
	display: inline-block;
	width: 40px;
	font-size: 12px;
	line-height: 18px;
	text-align: center;
	color: rgba(0, 0, 0, 0.3)
}

.desc_qrcode {
	margin-top: -30px;
	font-size: 13px;
	line-height: 19px;
	text-align: center
}

.box_qrcode {
	position: relative;
	width: 206px;
	height: 220px;
	margin: 20px auto 40px;
	padding: 24px 24px 0 24px;
	border: 4px solid #ffde01;
	box-sizing: border-box
}

.box_qrcode .qr_code {
	display: block;
	width: 150px;
	height: 150px
}

.box_qrcode .desc_code {
	overflow: hidden;
	padding-top: 10px
}

.box_qrcode .desc_code .btn_reset {
	float: right
}

.box_qrcode .txt_time {
	font-size: 12px;
	line-height: 20px;
	vertical-align: top
}

.box_qrcode .txt_time .emph_time {
	padding-left: 3px;
	color: #e65f3e;
	font-family: NotoSans-Bold, sans-serif;
	letter-spacing: .5px;
	vertical-align: top
}

.box_qrcode .btn_help {
	position: absolute;
	right: -34px;
	bottom: -5px
}

.ico_notice4 {
	width: 16px;
	height: 16px;
	margin: 3px;
	background-position: 0 -200px
}

.cont_find .tit_page {
	padding-top: 10px
}

.cont_find .desc_page {
	margin-top: 18px
}

.cont_find .desc_tip {
	margin-top: 10px
}

.cont_find .desc_notice {
	margin-top: 20px;
	font-size: 12px;
	line-height: 18px;
	color: #4c4c4c
}

.cont_find .desc_notice .ico_account {
	margin: 2px 4px 0 0
}

.cont_find .desc_notice .link_comm {
	margin-left: 4px
}

.cont_find .link_add {
	display: block;
	margin-top: 26px
}

.cont_find .link_point {
	display: block;
	color: #2c88de
}

.cont_find .txt_guide {
	font-size: 12px;
	color: #999
}

.cont_find .txt_guide .emph_count {
	color: #191919
}

.cont_find .fld_apply {
	margin-top: 4px
}

.cont_find .fld_apply .list_desc li {
	margin-top: 10px
}

.cont_find .fld_apply .wrap_btn2 {
	margin: 20px 0 0
}

.cont_find .info_external .thumb_info {
	margin-top: 26px
}

.cont_find .wrap_btn {
	margin-top: 40px
}

.cont_find .wrap_btn2 {
	margin-top: 50px
}

.cont_third .fld_apply {
	margin-top: 4px
}

.wrap_find {
	margin-top: 30px
}

.wrap_none {
	margin-top: 40px;
	border-top: 1px solid rgba(0, 0, 0, 0.08)
}

.wrap_none .box_find {
	padding: 20px 0;
	text-align: center
}

.wrap_none .box_find .tit_none {
	font-size: 14px;
	line-height: 20px;
	color: #4c4c4c
}

.wrap_none .box_find .txt_none {
	padding-top: 5px;
	font-size: 12px;
	line-height: 18px;
	color: #999
}

.wrap_match {
	margin-top: 20px;
	border-top: 1px solid rgba(0, 0, 0, 0.08)
}

.fld_pwd {
	margin-bottom: 48px
}

.fld_pwd .wrap_connectedservice {
	margin-top: -14px
}

.fld_pwd .wrap_btn3 {
	text-align: center
}

.box_find {
	padding: 20px 0;
	border-bottom: 1px solid rgba(0, 0, 0, 0.08);
	letter-spacing: 0
}

.box_find .link_prove {
	display: block;
	position: relative;
	padding-right: 80px;
	font-size: 13px;
	text-decoration: none
}

.box_find .link_prove .tit_prove {
	font-weight: normal;
	font-size: 18px;
	color: #191919
}

.box_find .link_prove .desc_prove {
	padding-top: 6px;
	font-size: 14px;
	color: #999
}

.box_find .link_prove .ico_arr {
	position: absolute;
	right: 0;
	top: 50%;
	width: 8px;
	height: 13px;
	margin: -7px 0 0;
	background-position: -190px -100px
}

.box_find .txt_contact {
	padding-top: 10px;
	font-size: 14px;
	line-height: 20px;
	color: #4c4c4c
}

.box_find .txt_contact .emph_contact {
	font-family: NotoSans-Bold, sans-serif;
	color: #191919
}

.box_find>.txt_contact:first-child {
	padding-top: 0
}

.box_find .emph_privacy {
	text-align: center;
	padding: 12px 0 40px;
	font-size: 18px;
	line-height: 24px;
	font-family: NotoSans-Bold, sans-serif;
	color: #191919;
	letter-spacing: -0.5px
}

.box_find .emph_privacy .desc_contact {
	display: block;
	font-family: NotoSans-Regular, AppleSDGothicNeo-Regular, "맑은 고딕",
		Malgun Gothic, "돋움", dotum, sans-serif
}

.box_find .desc_contact {
	padding-top: 10px;
	font-size: 12px;
	line-height: 18px;
	color: #999
}

.box_find .desc_contact .desc_sub {
	display: block;
	padding-top: 5px
}

.box_find .txt_desc {
	padding: 0;
	margin: 5px 0 12px;
	letter-spacing: -1px
}

.box_find .link_comm {
	margin-top: 20px
}

.box_find .link_comm+.link_point {
	margin-top: 10px
}

.txt_quiz {
	padding: 12px 0 0;
	font-size: 18px;
	line-height: 27px;
	color: #191919;
	text-align: center;
	word-break: keep-all;
	letter-spacing: 0
}

.txt_quiz .emph_name {
	display: inline-block;
	font-family: NotoSans-Bold, sans-serif
}

.wrap_quiz {
	width: 184px;
	margin: 20px auto 0;
	overflow: hidden
}

.wrap_quiz .item_inp {
	float: left;
	width: 82px;
	height: 82px;
	margin: 5px
}

.wrap_quiz .item_inp.item_on .frame_g {
	display: block
}

.wrap_quiz .item_inp .lab_g {
	width: 100%;
	height: 100%
}

.wrap_quiz .item_inp .lab_g:after {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: 2px solid #e3e5e8;
	content: '';
	box-sizing: border-box;
	z-index: 20
}

.wrap_quiz .item_inp .frame_g {
	display: none;
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 10
}

.wrap_quiz .item_inp .ico_check {
	width: 34px;
	height: 25px;
	margin: 32px 23px 0;
	background-position: -50px -220px
}

.wrap_quiz .item_inp .img_thumb {
	width: 100%;
	height: 100%
}

.wrap_quiz .item_inp .inp_g {
	width: 100%;
	height: 100%
}

.wrap_connectedservice+.wrap_btn3 {
	padding: 0 30px
}

.wrap_connectedservice+.wrap_btn3 .btn_g {
	float: left;
	width: 184px
}

.wrap_connectedservice+.wrap_btn3 .btn_g+.btn_g {
	margin: 0 0 0 10px
}

.wrap_connectedservice+.wrap_btn3 .btn_g:only-of-type {
	float: none;
	width: 100%
}

.kakao_layer .list_sequence:after {
	display: block;
	visibility: hidden;
	height: 0;
	font-size: 0;
	clear: both;
	content: ''
}

.kakao_layer .list_sequence li {
	position: relative;
	float: left
}

.kakao_layer .list_sequence li .desc_help {
	position: relative;
	font-size: 13px;
	line-height: 19px;
	color: #252525
}

.kakao_layer .list_sequence li .num_help {
	position: absolute;
	display: block;
	width: 18px;
	height: 18px;
	font-size: 11px;
	text-align: center;
	line-height: 17px;
	color: #fff;
	background-color: #666;
	border-radius: 50%
}

.kakao_layer .inner_ip_layer {
	max-width: 440px
}

.kakao_layer .inner_ip_layer .box_gray {
	margin-top: 10px;
	padding: 10px 20px 20px;
	background-color: #fafafa
}

.kakao_layer .inner_ip_layer .box_gray .tit_ip {
	font-family: NotoSans-Bold, sans-serif;
	font-size: 16px;
	color: #323232
}

.kakao_layer .inner_ip_layer .box_gray .item_radio {
	height: 20px;
	line-height: 19px;
	margin-top: 10px
}

.kakao_layer .inner_ip_layer .box_gray .item_radio .inp_radio {
	top: 0
}

.kakao_layer .inner_ip_layer .box_gray .lab_radio {
	font-size: 14px
}

.kakao_layer .inner_ip_layer .box_gray .lab_radio .ico_radio {
	margin-top: 0
}

.kakao_layer .inner_qrcode_layer {
	max-width: 720px
}

.kakao_layer .inner_qrcode_layer .tit_layer {
	padding-left: 10px;
	font-size: 20px
}

.kakao_layer .inner_qrcode_layer .list_sequence li {
	width: 220px;
	padding-top: 40px
}

.kakao_layer .inner_qrcode_layer .list_sequence li:before {
	position: absolute;
	left: -35px;
	top: 225px;
	display: block;
	width: 42px;
	height: 21px;
	content: '';
	background-position: 0 -220px;
	background-image:
		url("/assets/weblogin/techin/retina/ico_account-5bbf49f20922943cc44d5b2b6a36d5441231a95d2903df29763b18f87cc20103.png");
	background-size: 200px 300px
}

.kakao_layer .inner_qrcode_layer .list_sequence li:first-child:before {
	display: none
}

.kakao_layer .inner_qrcode_layer .list_sequence li:first-child .desc_help
	{
	margin-left: 36px
}

.kakao_layer .inner_qrcode_layer .list_sequence li:first-child .img_qrcode
	{
	margin-left: 0
}

.kakao_layer .inner_qrcode_layer .list_sequence li:last-child:before {
	left: -18px
}

.kakao_layer .inner_qrcode_layer .list_sequence li .img_qrcode {
	width: 210px;
	margin-left: 10px
}

.kakao_layer .inner_qrcode_layer .list_sequence li .desc_help {
	height: 55px;
	margin-left: 46px
}

.kakao_layer .inner_qrcode_layer .list_sequence li .num_help {
	left: -25px;
	top: 2px
}

.kakao_layer .inner_qrcode_layer .wrap_btn {
	margin-top: 30px
}

.kakao_layer .inner_qrcode_layer .wrap_btn .btn_g {
	width: 270px;
	margin: 0 auto
}

@media ( max-width :1250px) {
	.login_type3 #mArticle {
		padding: 59px 0
	}
	.login_type3 .wrap_banner {
		margin-right: 0
	}
	.login_type3 .wrap_form {
		max-width: 420px
	}
}

@media ( max-width :1023px) {
	.login_type3 .wrap_banner {
		display: none
	}
}

.ico_kakao {
	width: 20px;
	height: 20px;
	background-position: -60px -170px
}

.ico_phone {
	width: 16px;
	height: 24px;
	background-position: -90px -170px
}

.cont_guardian #mArticle {
	min-height: 592px
}

.cont_guardian .wrap_identity .fld_agree {
	margin-top: 13px
}

.cont_guardian .wrap_notice {
	margin-top: 80px
}

.wrap_identity .wrap_tbl {
	margin-top: 30px;
	border-top: 1px solid #e5e5e5
}

.wrap_identity .wrap_tbl .tit_tbl {
	margin: 30px 0 6px;
	font-size: 11px
}

.wrap_identity .wrap_agree {
	margin-top: 30px;
	padding-top: 20px;
	border-top: 1px solid #dfdfdf
}

.wrap_identity .wrap_agree+.wrap_btn {
	margin-top: 30px
}

.wrap_identity .desc_agree {
	position: relative;
	margin-top: 40px;
	padding-left: 28px;
	font-size: 14px;
	color: #252525
}

.wrap_identity .desc_agree .ico_check2 {
	position: absolute;
	top: 6px;
	left: 4px
}

.wrap_identity .item_check2 {
	margin-top: 40px
}

.wrap_input .tf_required {
	margin-top: 0;
	color: #4a4a4a
}

.wrap_input .item_tf .tf_g {
	font-family: NotoSans-Bold, sans-serif;
	font-size: 18px;
	line-height: 24px
}

.wrap_tms .ico_loading {
	display: block;
	margin: 46px auto 0
}

.ico_loading2 {
	width: 47px;
	height: 47px;
	background-position: 0 -170px;
	-webkit-animation: rotate 2s linear infinite;
	animation: rotate 2s linear infinite
}

.item_guardian.item_on .lab_g {
	border-color: #252525
}

.item_guardian+.item_guardian {
	margin-top: 12px
}

.item_guardian+.accordion_guardion {
	margin-top: 12px
}

.item_guardian .lab_g {
	padding: 19px 55px 19px 21px;
	border-color: #adadad;
	font-size: 16px;
	color: #252525
}

.item_guardian .ico_phone {
	float: left;
	margin: 0 12px 0 2px
}

.item_guardian .ico_kakao {
	float: left;
	margin: 2px 10px 0 0
}

.accordion_guardion {
	border-color: #adadad
}

.accordion_guardion.accordion_open {
	border-color: #252525
}

.accordion_guardion .link_accordion {
	font-size: 16px;
	color: #252525
}

.accordion_guardion .ico_kakao {
	margin-top: 2px
}

.txt_accounts2 {
	display: inline-block;
	overflow: hidden;
	position: relative;
	max-width: 100%;
	vertical-align: top;
	white-space: nowrap;
	text-overflow: ellipsis
}

.txt_accounts2 .txt_hidden {
	float: right;
	opacity: 0;
	filter: alpha(opacity = 0)
}

.txt_accounts2 .txt_domain {
	position: absolute;
	top: 0;
	right: 0
}

.cont_expired #mArticle {
	padding: 60px 70px 56px
}

.cont_expired .tit_step {
	margin-bottom: 0;
	letter-spacing: -1px
}

.cont_expired .box_info {
	margin-top: 25px;
	padding: 23px 55px 30px 33px;
	background-color: #fafafa
}

.cont_expired .box_info .tit_info {
	display: block;
	margin-top: 28px;
	font-size: 12px;
	color: #7c7c7c;
	font-weight: normal
}

.cont_expired .box_info .txt_accounts {
	margin-top: 7px;
	word-break: break-all
}

.cont_expired .box_info .txt_nickname, .cont_expired .box_info .txt_info
	{
	display: block;
	font-size: 12px;
	line-height: 18px;
	vertical-align: top;
	color: #7c7c7c;
	letter-spacing: -0.5px
}

.cont_expired .box_info .img_frame {
	background:
		url("/assets/weblogin/techin/retina/mask_bg_40x40_fafafa-76de14421765b8c0edf989bf6fee43d2523e73dd6e1651c38a22a331511dbf8a.png")
		0 0 no-repeat;
	background-size: 100% 100%
}

.cont_expired .thumb_profile {
	margin: 10px 13px 0 3px
}

.cont_expired .list_desc li {
	color: #959595;
	line-height: 18px
}

.cont_expired .list_desc .link_more {
	font-size: 12px;
	color: #2c88de
}

.cont_expired .wrap_btn {
	margin-top: 50px
}

.cont_expired .btn_g {
	color: #252525;
	font-size: 16px
}

.cont_expired .btn_continue {
	background-color: #f2f2f2
}

.cont_expired .wrap_link {
	margin-top: 25px;
	font-size: 0;
	text-align: center
}

.list_expired {
	font-size: 0;
	text-align: left
}

.list_expired dt {
	float: left;
	width: auto;
	padding-right: 11px;
	color: #7c7c7c;
	font-size: 12px;
	line-height: 24px;
	vertical-align: top;
	letter-spacing: -1px
}

.list_expired dd {
	display: block;
	overflow: hidden;
	color: #252525;
	font-family: NotoSans-Bold, NotoSans-Regular, AppleSDGothicNeo-Regular,
		"맑은 고딕", Malgun Gothic, "돋움", dotum, sans-serif;
	font-size: 16px;
	line-height: 24px;
	vertical-align: top;
	word-break: break-all
}

.ico_warning {
	width: 15px;
	height: 15px;
	margin-top: 7px;
	background-position: 50px -60px
}

.link_notmine {
	display: inline-block;
	color: #4a4a4a;
	font-size: 14px;
	text-align: center;
	text-decoration: underline
}

@media ( max-width :580px) {
	#kakaoServiceLogo {
		font-size: 18px
	}
	.account_comm {
		display: block
	}
	.account_comm #kakaoWrap {
		display: block;
		height: auto;
		min-height: 100%;
		padding: 50px 0 122px;
		box-sizing: border-box
	}
	.account_comm #kakaoFoot {
		position: absolute;
		right: 0;
		bottom: 0;
		left: 0;
		padding: 0 10px 15px
	}
	.account_comm #mArticle {
		max-width: 100%;
		min-height: auto;
		margin: 40px 0 0;
		padding: 0 40px 139px;
		border: 0
	}
	.btn_g {
		border: 1px solid rgba(0, 0, 0, 0.1)
	}
	.wrap_btn.type_fixed {
		position: relative;
		right: auto;
		bottom: auto;
		left: auto;
		margin-top: 40px
	}
	.wrap_btn.type_fixed .btn_g {
		width: calc(50% - 3px)
	}
	.wrap_btn .link_receive {
		margin-top: 16px;
		padding: 10px
	}
	.wrap_inp .item_radio+.item_radio {
		margin-left: 20px
	}
	.cont_third #mArticle {
		margin: 0
	}
	.cont_third .wrap_btn3 {
		left: auto;
		right: auto
	}
	.account_type2 #mArticle {
		padding-bottom: 50px
	}
	.link_change {
		margin: 2px 0 -8px;
		padding: 8px 5px 8px 0
	}
	.type_popup #kakaoWrap {
		padding-top: 35px
	}
	.type_popup #kakaoContent #mArticle {
		padding-left: 35px;
		padding-right: 35px;
		margin: 0
	}
	.type_popup .wrap_btn3 {
		left: 35px;
		right: 35px
	}
	.wrap_connectedservice+.wrap_btn3 {
		width: 100%;
		padding: 0;
		margin: 0 auto
	}
	.wrap_connectedservice+.wrap_btn3 .btn_g {
		width: calc(50% - 5px)
	}
	.wrap_btn3 {
		position: relative;
		right: auto;
		bottom: auto;
		left: auto;
		margin-top: 40px
	}
	.account_type3 #mArticle {
		padding: 0 40px
	}
	.account_type3 .wrap_btn3 {
		left: auto;
		right: auto;
		bottom: auto
	}
	.cont_find .desc_notice .link_comm {
		margin-top: -8px;
		padding: 8px 5px 8px 0
	}
	.cont_find .link_add {
		margin: 18px 0 -8px;
		padding: 8px 5px 8px 0
	}
	.cont_find .fld_apply .wrap_btn2 {
		margin: 15px 0 0
	}
	.fld_apply .wrap_btn2 {
		margin-top: 10px
	}
	.fld_apply .wrap_btn2 .link_verify {
		display: block
	}
	.fld_apply .wrap_btn2 .link_verify, .fld_apply .wrap_btn2 .btn_g,
		.fld_apply .wrap_btn2 .error_email {
		float: none;
		margin-top: 10px
	}
	.fld_apply .wrap_btn2 .link_verify:first-child, .fld_apply .wrap_btn2 .btn_g:first-child,
		.fld_apply .wrap_btn2 .error_email:first-child {
		margin-top: 0
	}
	.fld_apply .wrap_btn2 .link_comm {
		padding: 8px 0
	}
	.fld_apply .wrap_btn2 .btn_send {
		float: right;
		width: 74px;
		height: 36px;
		margin-top: 0
	}
	.fld_apply .wrap_inp .item_radio+.item_radio {
		margin-left: 40px
	}
	.fld_apply .type_gender .item_radio+.item_radio {
		margin: 0
	}
	.box_find .link_comm {
		margin: 10px 0 -10px;
		padding: 5px 5px 5px 0
	}
	.type_birth .select_year {
		width: 90px
	}
	.type_birth .select_month {
		width: 70px
	}
	.type_telecom .item_select+.item_tf {
		margin-left: 0;
		width: calc(100% - 115px)
	}
	.type_resident .box_dot .ico_dot {
		margin-left: 5px
	}
	.type_resident .box_dot .ico_dot:first-child {
		margin-left: 5px
	}
	.type_phone .item_tf .tf_send {
		padding: 0 85px 0 10px
	}
	.type_phone .item_select .list_select {
		bottom: auto;
		top: 45px;
		max-height: 280px
	}
	.tf_required .btn_help {
		padding: 5px;
		margin: -8px -5px -5px -3px
	}
	.kakao_layer .inner_kakao_layer {
		position: relative;
		height: auto;
		max-width: 100%;
		max-height: 100%;
		padding: 35px 25px 25px;
		overflow-y: scroll
	}
	.kakao_layer .inner_kakao_layer:after {
		content: '';
		clear: both;
		display: block
	}
	.kakao_layer .inner_kakao_layer .layer_head {
		padding-right: 12px
	}
	.kakao_layer .inner_kakao_layer .layer_body {
		overflow-x: hidden;
		overflow-y: auto;
		max-height: 402px
	}
	.kakao_layer .inner_kakao_layer .wrap_inp .item_radio {
		float: none;
		display: block;
		padding: 0;
		margin: 0
	}
	.kakao_layer .inner_kakao_layer .wrap_btn2 {
		width: 100%;
		margin: 30px auto 0
	}
	.kakao_layer .inner_kakao_layer .wrap_btn2 .btn_g {
		width: calc(50% - 5px)
	}
	.kakao_layer .inner_kakao_layer .wrap_btn2 .btn_g+.btn_g {
		margin-left: 10px
	}
	.kakao_layer .inner_terms_layer {
		padding-top: 100px
	}
	.kakao_layer .inner_terms_layer .layer_head {
		margin-top: -81px
	}
	.kakao_layer .inner_terms_layer .layer_body {
		max-height: 100%
	}
	.kakao_layer .inner_terms_layer3 {
		padding-top: 108px
	}
	.kakao_layer .inner_terms_layer3 .layer_head {
		margin-top: -90px
	}
	.kakao_layer .inner_terms_layer3 .layer_body {
		max-height: 100%
	}
	.kakao_layer .inner_terms_layer4 {
		padding-top: 85px
	}
	.kakao_layer .inner_terms_layer4 .layer_head {
		margin-top: -67px
	}
	.kakao_layer .inner_terms_layer4 .layer_body {
		max-height: 100%
	}
	.kakao_layer .inner_campaign_layer {
		padding: 0
	}
	.kakao_layer .inner_campaign_layer .layer_head {
		height: 203px;
		padding: 0;
		background-position-x: 50%
	}
	.kakao_layer .inner_campaign_layer .tit_layer {
		padding-top: 31px;
		font-size: 19px;
		line-height: 27px;
		opacity: .9
	}
	.kakao_layer .inner_campaign_layer .layer_body {
		padding: 22px 25px 25px
	}
	.kakao_layer .inner_campaign_layer .txt_layer {
		font-size: 12px;
		line-height: 17px;
		letter-spacing: 0
	}
	.kakao_layer .inner_campaign_layer .txt_layer+.txt_layer {
		margin-top: 11px
	}
	.kakao_layer .inner_campaign_layer .link_more {
		margin-top: 13px;
		font-size: 12px;
		line-height: 15px
	}
	.kakao_layer .inner_campaign_layer .wrap_btn {
		margin-top: 26px
	}
	.kakao_layer .inner_campaign_layer .wrap_btn .btn_g {
		width: 100%
	}
	.footer_comm .service_info {
		display: block;
		padding: 10px 0 0;
		text-align: center;
		font-size: 0
	}
	.footer_comm .link_info {
		padding: 0 5px
	}
	.footer_comm .item_select {
		padding: 0 5px
	}
	.login_type1 #kakaoFoot .service_info {
		border-top: 1px solid #d8d8d8
	}
	.login_type2 #kakaoHead {
		position: relative;
		top: auto;
		left: auto;
		padding: 0 20px
	}
	.login_type2 #kakaoHead #kakaoServiceLogo {
		width: auto;
		height: auto
	}
	.login_type2 #kakaoFoot .service_info {
		border-top: 1px solid #fff
	}
	.login_type2 .util_tf .btn_del .ico_del {
		background-position: -170px -270px
	}
	.login_type3 #kakaoServiceLogo {
		display: block;
		margin: 0 auto 40px
	}
	.login_type3 #mArticle {
		min-height: auto;
		margin: 0
	}
	.login_type3 #kakaoFoot {
		border-top: 0 none
	}
	.login_type3 #kakaoFoot .service_info {
		border-top: 1px solid #d8d8d8
	}
	.login_type3 .wrap_form {
		padding: 0;
		border: 0
	}
	.cont_login #mArticle {
		padding-left: 20px;
		padding-right: 20px
	}
	.cont_login .tit_intro {
		display: none
	}
	.cont_login .tit_page {
		font-size: 20px
	}
	.cont_login .tit_choice {
		margin-top: 50px
	}
	.cont_login .tit_certify {
		margin-top: 50px
	}
	.cont_login .item_tf .tf_g {
		font-size: 15px
	}
	.cont_qr #mArticle {
		padding-left: 40px;
		padding-right: 40px
	}
	.login_certify .item_tf .tf_g {
		font-size: 16px
	}
	.list_account {
		padding-bottom: 20px
	}
	.wrap_btn .btn_more {
		margin-top: -10px
	}
	.item_select .list_select {
		top: auto;
		bottom: 0
	}
	.tit_main {
		word-spacing: 1px;
		letter-spacing: -2px
	}
	.desc_main {
		letter-spacing: -1px
	}
	.util_tf .btn_del {
		padding: 5px;
		margin-right: -5px
	}
	.util_tf .btn_del .ico_del {
		width: 16px;
		height: 16px;
		background-position: -170px -250px
	}
	.fld_pwd {
		margin-bottom: 0
	}
	.info_identity {
		padding-top: 0
	}
	.info_identity .tit_identity {
		margin-top: 40px;
		word-break: keep-all
	}
	.info_identity .desc_identity {
		margin-top: 20px;
		word-break: keep-all
	}
	.cont_authentic .item_check {
		float: none
	}
	.cont_merge #mArticle {
		padding: 0 20px 139px
	}
	.cont_merge.merge_type2 #mArticle {
		margin-bottom: -11px;
		padding-bottom: 0
	}
	.cont_merge.merge_type2 .wrap_btn3 {
		margin-top: 30px
	}
	.cont_merge .tit_page2 {
		font-size: 19px;
		line-height: 26px
	}
	.cont_merge .desc_page2 {
		margin-top: 6px;
		font-size: 13px;
		line-height: 20px;
		letter-spacing: -0.03em
	}
	.cont_merge .desc_page2 br {
		display: none
	}
	.cont_merge .img_confirm {
		width: 236px;
		margin: 23px auto 0
	}
	.cont_merge .guide_info {
		padding-top: 16px
	}
	.cont_merge .guide_info .link_guide {
		font-size: 13px;
		line-height: 18px
	}
	.cont_merge .desc_notice {
		padding-top: 20px;
		font-size: 12px;
		line-height: 18px;
		color: #7c7c7c;
		letter-spacing: -0.03em
	}
	.cont_merge .desc_notice br {
		display: none
	}
	.cont_merge .list_notice {
		padding-top: 12px;
		letter-spacing: 0
	}
	.cont_merge .list_notice li {
		margin-top: 8px;
		padding-left: 9px;
		font-size: 12px;
		line-height: 18px;
		letter-spacing: -0.03em
	}
	.cont_merge .list_notice li:after {
		top: 7px;
		width: 3px;
		height: 3px;
		border-radius: 3px
	}
	.cont_merge .list_notice br {
		display: none
	}
	.cont_merge .wrap_btn {
		margin-top: 30px
	}
	.cont_merge .wrap_btn .btn_confirm {
		height: 44px;
		font-size: 14px;
		color: #252525
	}
	.cont_merge .wrap_btn .btn_melon {
		width: 100%;
		height: 40px;
		margin: 0;
		border: 1px solid #00cd3c;
		border-radius: 40px;
		font-size: 14px;
		line-height: 40px;
		color: #00cd3c;
		background-color: #fff
	}
	.cont_merge .box_account {
		margin-top: 30px;
		padding: 11px 14px 13px 78px;
		letter-spacing: 0
	}
	.cont_merge .box_account .thumb_profile {
		position: absolute;
		left: 14px;
		top: 50%;
		width: 52px;
		height: 52px;
		margin-top: -26px;
		border-radius: 7px
	}
	.cont_merge .box_account .thumb_profile .img_frame {
		background-image:
			url("/assets/weblogin/techin/retina/mask_bg_52x52-71f412a29fd043d0272e614e1442ca6e1560d164203d443caa6d56ca4156f5ef.png")
	}
	.cont_merge .box_account .tit_account {
		max-height: 57px;
		font-weight: normal;
		font-size: 15px;
		line-height: 19px;
		font-family: NotoSans-Medium, sans-serif
	}
	.cont_merge .box_account .desc_account {
		padding-top: 5px;
		font-size: 12px;
		line-height: 18px
	}
	.cont_merge .box_account .txt_date {
		font-size: 12px;
		line-height: 18px
	}
	.cont_merge .bg_arrow {
		width: 16px;
		height: 16px;
		margin: 10px auto 2px;
		background-position: -130px -220px
	}
	.cont_merge .tit_accinfo {
		font-weight: normal;
		font-size: 13px;
		line-height: 19px;
		font-family: NotoSans-Medium, sans-serif
	}
	.cont_merge .wrap_account {
		margin-top: 8px;
		padding: 0 14px;
		border: 1px solid rgba(0, 0, 0, 0.1);
		border-radius: 7px
	}
	.cont_merge .item_account {
		margin: 0;
		padding: 16px 0 14px;
		border-top: 1px solid rgba(0, 0, 0, 0.08);
		letter-spacing: 0
	}
	.cont_merge .item_account:first-child, .cont_merge .item_account.only_account
		{
		padding-top: 14px
	}
	.cont_merge .item_account .tit_account .ico_account {
		width: 16px;
		height: 20px;
		margin-right: 4px
	}
	.cont_merge .item_account .tit_account .ico_melon {
		background-position: -110px -220px
	}
	.cont_merge .item_account .tit_account .ico_daum {
		background-position: -90px -220px
	}
	.cont_merge .item_account .tit_account .txt_account {
		max-height: 60px;
		font-weight: normal;
		font-size: 13px;
		line-height: 20px;
		font-family: NotoSans-Medium, sans-serif
	}
	.cont_merge .item_account .detail_account {
		margin-top: 6px;
		padding: 3px 0
	}
	.cont_merge .item_account .thumb_profile {
		margin-right: -12px;
		width: 38px;
		height: 38px
	}
	.cont_merge .item_account .thumb_profile .img_frame {
		background-image:
			url("/assets/weblogin/techin/retina/mask_bg_38x38-0f5e433eff4e7baa84de0be70929689c5abb07836eaee53a3cd89e4088b5053e.png")
	}
	.cont_merge .item_account .account_info {
		padding-left: 20px
	}
	.cont_merge .item_account .inner_info {
		height: 38px
	}
	.cont_merge .item_account .txt_name {
		font-size: 12px;
		line-height: 18px
	}
	.cont_merge .item_account .txt_date {
		font-size: 12px;
		line-height: 18px
	}
	.cont_merge .item_account .state_coupon {
		top: 2px;
		height: 18px;
		padding: 0 7px 0 4px;
		font-size: 10px;
		line-height: 18px
	}
	.cont_merge .item_account .state_coupon .ico_coupon {
		margin-top: -4px;
		width: 5px;
		height: 8px;
		background-position: -10px -15px;
		background-size: 20px 25px
	}
	.cont_merge .item_account .state_coupon.state_none .ico_coupon {
		background-position: 0 -15px
	}
	.cont_merge .item_account .detail_nodate .state_coupon {
		margin-top: -10px
	}
	.cont_merge .item_account .detail_noimage {
		margin-top: 1px
	}
	.cont_merge .melon_account .detail_account {
		padding-right: 73px
	}
	.cont_merge .wrap_caution {
		padding-top: 3px;
		letter-spacing: -0.03em
	}
	.cont_merge .wrap_caution li {
		margin-top: 10px
	}
	.cont_merge .wrap_caution .link_caution {
		display: block;
		position: relative;
		padding: 0 46px 0 9px;
		font-size: 12px;
		line-height: 18px
	}
	.cont_merge .wrap_caution .link_caution:after {
		top: 8px;
		width: 3px;
		height: 3px;
		border-radius: 3px
	}
	.cont_merge .wrap_caution .ico_arr {
		top: 3px;
		width: 12px;
		height: 12px;
		background-position: -40px -280px
	}
	.cont_merge .wrap_caution .desc_caution {
		padding: 6px 52px 0 9px;
		font-size: 11px;
		line-height: 16px
	}
	.cont_merge .wrap_caution .on .ico_arr {
		background-position: -60px -280px
	}
	.cont_merge .tit_done {
		font-size: 19px;
		line-height: 26px
	}
	.cont_merge .info_done {
		margin-top: 66px;
		border-radius: 6px
	}
	.cont_merge .info_done .wrap_profile {
		top: -26px
	}
	.cont_merge .info_done .thumb_profile {
		width: 52px;
		height: 52px
	}
	.cont_merge .info_done .img_frame {
		background-image:
			url("/assets/weblogin/techin/retina/m_mask_bg_half-3c5bcf72cf509f24826e405c5aa6185e747a6c7a3369c20d33804c087483d19b.png")
	}
	.cont_merge .info_done .info_profile {
		padding: 32px 16px 0
	}
	.cont_merge .info_done .tit_account {
		max-height: 48px;
		font-weight: normal;
		font-size: 16px;
		line-height: 24px;
		font-family: NotoSans-Medium, sans-serif
	}
	.cont_merge .info_done .desc_account {
		padding-top: 4px;
		font-size: 13px;
		line-height: 19px
	}
	.cont_merge .info_done .txt_date {
		font-size: 13px;
		line-height: 19px
	}
	.cont_merge .info_done .btn_g {
		margin-top: 12px;
		height: 28px;
		padding: 0 13px;
		font-size: 12px;
		line-height: 26px
	}
	.cont_merge .info_done .img_done {
		width: 230px;
		margin: 22px auto 0
	}
	.cont_merge .desc_done {
		margin-top: 15px;
		padding-left: 8px;
		font-size: 12px;
		line-height: 18px;
		letter-spacing: -0.03em;
		color: #999
	}
	.cont_merge .desc_done:after {
		top: 8px;
		width: 3px;
		height: 3px;
		border-radius: 3px;
		background-color: #999
	}
	.cont_mail #mArticle {
		padding: 0 20px 50px
	}
	.cont_login .login_kakaomail .wrap_btn, .cont_login .login_kakaomail .box_error
		{
		margin-top: 30px
	}
	.login_kakaomail .tit_page, .login_kakaomail .item_security {
		display: none
	}
}

@media ( min-width :480px) {
	.login_kakaotalk .wrap_captcha {
		width: 304px;
		margin: 0 auto
	}
}

@media ( max-width :390px) {
	.type_telecom {
		height: auto
	}
	.type_telecom .item_select {
		display: block;
		float: none;
		width: 100%;
		border-bottom: 2px solid #ebebeb
	}
	.type_telecom .item_select .ico_arr {
		position: absolute;
		right: 0;
		top: 0
	}
	.type_telecom .item_select+.item_tf {
		width: 100%;
		margin: 8px 0 0
	}
	.type_telecom+.item_tf {
		margin: 12px 0 0
	}
}

@media ( max-width :359px) {
	.cont_authentic .item_check {
		float: none
	}
	.cont_authentic .item_radio {
		display: block
	}
	.cont_authentic .item_radio+.item_radio {
		margin-left: 0
	}
	.type_birth .select_year {
		width: 65px
	}
	.type_birth .select_month {
		width: 55px
	}
	.type_birth .select_day {
		width: 55px
	}
	.type_resident .box_dot .ico_dot {
		margin-left: 2px
	}
	.type_resident .box_dot .ico_dot:first-child {
		margin-left: 0
	}
	.fld_apply .wrap_inp .item_radio+.item_radio {
		margin-left: 20px
	}
	.fld_apply .type_gender .item_radio+.item_radio {
		margin: 0
	}
	.box_telecom.box_twins .btn_g {
		padding: 0;
		font-size: 13px
	}
}

@media only screen and (-webkit-min-device-pixel-ratio:1.5) , only screen and
		(min-device-pixel-ratio:1.5) , only screen and
	(min-resolution:1.5dppx) {
	.ico_account {
		background-image:
			url("/assets/weblogin/techin/retina/ico_account-5bbf49f20922943cc44d5b2b6a36d5441231a95d2903df29763b18f87cc20103.png");
		background-size: 200px 300px
	}
	.cont_merge .item_account .state_coupon .ico_coupon {
		background-image:
			url("/assets/weblogin/techin/retina/ico_coupon-1da9cdc034254319a64b5bd3d3a1a127cd0d4684587903c869e22760a80d7f45.png");
		background-size: 20px 25px
	}
	#kakaoServiceLogo {
		background-image:
			url("/assets/weblogin/techin/retina/ico_account-5bbf49f20922943cc44d5b2b6a36d5441231a95d2903df29763b18f87cc20103.png");
		background-size: 200px 300px
	}
	.img_certify {
		background-image:
			url("/assets/weblogin/techin/retina/img_certify-aa3f6852e30ca5a92f58a6f32dfec09a0c2f979267f19ef5ac9b76ef6b3e14ff.png");
		background-size: 388px 252px
	}
	.ico_accountcheck {
		background-image:
			url("/assets/weblogin/techin/retina/ico_accountcheck-458283cb9064c1a7aa554ee5e68b7f76aa44c47b047ae09f2c4266e4f31ef2f7.png");
		background-size: 350px 100px
	}
	.img_login {
		background-image:
			url("/assets/weblogin/techin/retina/img_login-5bc7d64ba9c2bbac60bc17ce3f94a1ced92a74148d36108f69dcb6f7f13c56cc.png");
		background-size: 450px 80px
	}
	.kakao_layer .inner_campaign_layer .layer_head {
		background-size: 157px 104px
	}
}

@media only screen and (-webkit-min-device-pixel-ratio:1.5) and
		(min-width:580px) , only screen and (min-device-pixel-ratio:1.5) and
		(min-width:580px) , only screen and (min-resolution:1.5dppx) and
	(min-width:580px) {
	.cont_merge .box_account .thumb_profile .img_frame {
		background-image:
			url("/assets/weblogin/techin/retina/mask_bg_72x72-fd14cc16450d5112a96058e3f29c4ea615789a59c1c3ee7653b683dd567fc5bf.png")
	}
	.cont_merge .item_account .thumb_profile .img_frame {
		background-image:
			url("/assets/weblogin/techin/retina/mask_bg_54x54-29336d0d4a1d17fcbeb63ef763acef761fde2a3d7df7764469efe6a3b674490d.png")
	}
	.info_done .img_frame {
		background-image:
			url("/assets/weblogin/techin/retina/mask_bg_half-0636332d3990dbbdf711d42aa72ff24a9065b8e991352905dc19d1be449a490b.png")
	}
	.kakao_layer .inner_campaign_layer .layer_head {
		background-image:
			url("/assets/weblogin/techin/retina/img_security-1f5e6901090886f6680e84406ba5214b1a5455ddfdee26369eaa02ab3ecccfb3.png");
		background-size: 284px 187px
	}
}

#recaptcha {
	margin: 1px;
}
</style>
</head>
<body class="account_comm account_type2">
	<!-- 카카오 로그인 sdk -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
		Kakao.init("0ff663d827e934918400ca41b464f8ba"); //JS KEY

		Kakao.Auth.login({
			success : function(authObj) {

				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						console.log(res);

						var id = res.id;
						var email = res.kakao_account.email;
						var name = res.properties.nickname;

						$('#kid').val(id);
						$('#kname').val(name);
						$('#kemail').val(email);
					}
				})
				console.log(authObj);
				var token = authObj.access_token;
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	</script>

	<div id="kakaoWrap">
		<div id="kakaoHead" role="banner">
			<img src="/hhw/resources/images/icon/kakao.png">
		</div>
		<!-- // kakaoHead -->
		<hr class="hide">
		<div id="kakaoContent" class="cont_join cont_guardian cont_merge"
			role="main">
			<div id="cMain">
				<div id="mArticle">
					<!-- page select -->
					<div id="page-select-verify-method-for-create" data-role="page"
						data-account-type="account_type2"
						data-url="page-select-verify-method-for-create"
						class="km-page-active">
						<h2 class="tit_page">
							카카오 아이디로<br> 로그인을 시작합니다!
						</h2>
						<p class="desc_page">
							카카오계정 하나로<br> Hi Hello World 서비스를 이용할 수 있어요.
						</p>

						<div class="box_intro">
							<div class="wrap_btn">
								<form action="kakaoLogin.do" method="post">
									<input type="hidden" name="kid" id="kid"> <input
										type="hidden" name="kname" id="kname"> <input
										type="hidden" name="kemail" id="kemail">
									<button class="btn_g btn_confirm verify_eamil" type="submit">카카오
										계정으로 로그인</button>
								</form>
							</div>
						</div>

					</div>
				</div>
				<!--// mArticle -->
			</div>
			<!-- // cMain -->
		</div>
		<div id="kakaoFoot" class="footer_comm" role="contentinfo">
			<h2 class="screen_out">서비스 이용정보</h2>
			<div class="service_info">
				<a href="https://www.kakao.com/policy/terms?lang=ko"
					class="link_info">이용약관</a><span class="txt_bar"></span> <a
					href="https://www.kakao.com/policy/privacy?lang=ko"
					class="link_info link_policy">개인정보 처리방침</a><span class="txt_bar"></span>
				<a href="https://www.kakao.com/policy/oppolicy?lang=ko"
					class="link_info">운영정책</a><span class="txt_bar"></span> <a
					href="https://cs.kakao.com/" class="link_info">고객센터</a> <a
					href="https://www.kakao.com/notices?lang=ko" class="link_info">공지사항</a><span
					class="txt_bar"></span>
				<div class="item_inp item_select">
					<span class="screen_out">언어 선택상자</span> <span class="screen_out">선택내용</span>
					<a
						href="https://accounts.kakao.com/weblogin/create_account?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount#none"
						class="link_selected">한국어 <span class="ico_account ico_arr">선택옵션</span>
					</a>
					<ul class="list_select">
						<li><a
							href="https://accounts.kakao.com/weblogin/create_account?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount&amp;lang=ko"
							class="link_select">한국어</a></li>
						<li><a
							href="https://accounts.kakao.com/weblogin/create_account?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount&amp;lang=en"
							class="link_select">English</a></li>
						<li><a
							href="https://accounts.kakao.com/weblogin/create_account?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount&amp;lang=ja"
							class="link_select">日本語</a></li>
					</ul>
				</div>
			</div>
			<small class="txt_copyright">Copyright © <a
				href="https://www.kakaocorp.com/?lang=ko" class="link_kakao">Kakao
					Corp.</a> All rights reserved.
			</small>
		</div>
	</div>
</body>
</html>