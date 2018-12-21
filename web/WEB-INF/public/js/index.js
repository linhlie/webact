document.addEventListener('DOMContentLoaded',function(){
    //xu ly dang nhap
    var dangnhap = document.querySelectorAll('.dangnhap'),
    themtaikhoan = document.querySelectorAll('.themtaikhoan'),
 nenden = document.querySelectorAll('.nenden');
 var formlogin = document.getElementsByClassName('formlogin');
 var formdangky = document.getElementsByClassName('formdangky');
dangnhap[0].onclick = function(){
    nenden[0].classList.add('shownen');
    formlogin[0].classList.add('showDN');   
}
themtaikhoan[0].onclick = function(){
    nenden[0].classList.add('shownen');
    formdangky[0].classList.add('showDK');
}
nenden[0].onclick = function(){
    nenden[0].classList.remove('shownen');
    formlogin[0].classList.remove('showDN');
    formdangky[0].classList.remove('showDK');
}
    //xu ly phan noi dung
// var content_chonloc = document.querySelectorAll('.content_chonloc'),
// content_moi = document.querySelectorAll('.content_moi');
// var content_mienphi = document.querySelectorAll('.content_mienphi'),
// content_tainhieu =  document.querySelectorAll('.content_tainhieu'),
    
},false);