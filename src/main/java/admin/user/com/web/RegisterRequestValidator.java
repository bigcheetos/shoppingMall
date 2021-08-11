package admin.user.com.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import admin.user.com.service.MberManageVO;


public class RegisterRequestValidator implements Validator{
	private static final String emailRegExp =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
            "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    private Pattern pattern;
 
    public RegisterRequestValidator() {

        pattern = Pattern.compile(emailRegExp);
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return MberManageVO.class.isAssignableFrom(clazz);
    }
 
    @Override
    public void validate(Object target, Errors errors) {
    	MberManageVO regReq = (MberManageVO) target;
        if(regReq.getEmailId() == null || regReq.getEmailId().trim().isEmpty()) {
            errors.rejectValue("emailId", "required", "필수 정보 입니다.");
        } else {
            Matcher matcher = pattern.matcher(regReq.getEmailId());
            if(!matcher.matches()) {
                errors.rejectValue("emailId", "bad", "올바르지 않는 형식입니다.");
            }
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memName", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmpty(errors, "password", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmpty(errors, "pwCheck", "required", "필수 정보 입니다.");
        
        if(!regReq.getPassword().isEmpty()) {
            if(!regReq.getPassword().equals(regReq.getPwCheck())) {
                errors.rejectValue("pwCheck", "nomatch", "비밀번호가 일치하지 않습니다.");
            }
        }
        
        String pwPattern = "^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{8,16}$";
        Matcher matcher = Pattern.compile(pwPattern).matcher(regReq.getPassword());
         
        pwPattern = "(.)\\1\\1\\1";
        Matcher matcher2 = Pattern.compile(pwPattern).matcher(regReq.getPassword());
         
        if(!matcher.matches()){
            errors.rejectValue("password", "bad", "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
        }
         
        if(matcher2.find()){
        	errors.rejectValue("password", "bad", "연속되는 문자는 사용할 수 없습니다.");
        }
         
        if(regReq.getPassword().contains(" ")){
        	errors.rejectValue("password", "bad", "띄어쓰기 없이 입력해 주세요.");
        }


    }
}
