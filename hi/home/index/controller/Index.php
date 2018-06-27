<?php
namespace app\index\controller;
use think\Db;
use think\Controller;
class Index extends Controller
{
    public function index()
    {  
        
        if(request()->isPost()){
            $sid=$_POST['sid'];//身份证
            $data= Db::name('register')->where('sid',$sid)->find();
            if($data!=null){
                return "<script> alert('你已注册报到过了！'); window.history.back(-1);</script>";
               }else{
                $report='1';//报到情况
                $sname=$_POST['sname'];//学生姓名
                $ssex=$_POST['ssex'];//性别
                $spename=$_POST['spename'];//录取专业
                $classname=$_POST['classname'];//所在班级
                $demoney="0";//银行扣费情况
                $phone1=$_POST['phone1'];//电话1
                $phone2=$_POST['phone2'];//电话2
                $address=$_POST['address'];//家庭住址
                $prove=$_POST['prove'];//贫困证明
                $insurance=$_POST['insurance'];//校园保险
                $Expense=$_POST['Expense'];//住宿意向
                $sick=$_POST['sick'];//病史
                $special=$_POST['special'];//特殊说明
 
                $relation_s=input('post.relation/a');
                $parentname_s=input('post.parentname/a');
                $parentwork_s=input('post.parentwork/a');
                $parentphone_s=input('post.parentphone/a');

                $relation = implode(",", $relation_s);
                $parentname = implode(",", $parentname_s);
                $parentwork = implode(",", $parentwork_s);
                $parentphone = implode(",", $parentphone_s);

                $data=[
                        'sid'=>$sid,'demoney'=>$demoney,'phone1'=>$phone1,
                        'phone2'=>$phone2,'address'=>$address,'prove'=>$prove,'insurance'=>$insurance,
                        'Expense'=>$Expense,'sick'=>$sick,'special'=>$special,'report'=>$report
                    ];

           $family=[
                    'sid'=>$sid,'sname'=>$sname,'relation'=>$relation,
                    'parentname'=>$parentname,'parentwork'=>$parentwork,
                    'parentphone'=>$parentphone
                     ];

                $res=Db::name('register')->insert($data);
                $res=Db::name('family')->insert($family);
                if($res==1){
                      return "<script> alert('恭喜你报到成功！'); window.history.back(-1);</script>";
                  }else{
                    return "<script> alert('报到失败！'); window.history.back(-1);</script>";
                  }
            }
        }
        return $this->fetch();
    }





    public function find(){
      return $this->fetch();
    }
    public function edit(){
        return $this->fetch();
    }
    public function test(){
       $sid=input('id');
       $data= Db::name('student')->where('sid',$sid)->find();
       $res=jsona($data);
       return $this->fetch();
    }
}
