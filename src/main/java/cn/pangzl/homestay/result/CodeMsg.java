package cn.pangzl.homestay.result;

public class CodeMsg {
	
	private int code;
	private String msg;
	
	//通用的错误码
	public static CodeMsg SUCCESS = new CodeMsg(0, "success");
	public static CodeMsg SERVER_ERROR = new CodeMsg(500100, "服务端异常");
	public static CodeMsg BIND_ERROR = new CodeMsg(500101, "参数校验异常：%s");
	//登录模块 5002XX
	public static CodeMsg PASSWORD_ERROR = new CodeMsg(500200, "用户名或密码错误");
	public static CodeMsg MOBILE_NOT_EXIST = new CodeMsg(500201, "用户名不存在");
	public static CodeMsg MOBILE_IS_NULL = new CodeMsg(500202, "用户名为空");
	public static CodeMsg PASSWORD_IS_NULL = new CodeMsg(500203, "密码为空");
	public static CodeMsg USER_IS_NULL = new CodeMsg(500204, "用户为空");
	
	//房间管理
	public static CodeMsg NO_ROOM = new CodeMsg(500300, "房间数量为空，未添加房间");
	
	//旅客管理
	public static CodeMsg CUSTOMER_NOT_EXIT = new CodeMsg(500401, "未找到该旅客");
	public static CodeMsg CUSTOMER_EXIT = new CodeMsg(500401, "旅客已存在");
	
	private CodeMsg( ) {
	}
			
	private CodeMsg( int code,String msg ) {
		this.code = code;
		this.msg = msg;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public CodeMsg fillArgs(Object... args) {
		int code=this.code;
		String message=String.format(this.msg, args);
		return new CodeMsg(code,message);
	}

	@Override
	public String toString() {
		return "CodeMsg [code=" + code + ", msg=" + msg + "]";
	}
	
	
}
