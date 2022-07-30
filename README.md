# TextFieldPractice
텍스트필드 연습
## 학습내용
### UITextField
  - UITextField의 기본적인 설정 방법 연습.
  - UITextFieldDelegate 프로토콜을 채택하는 방법과 프로토콜 관련 메서드 구현 연습.
  - 노션 : <https://www.notion.so/UITextFieldDelegate-2f081d1f98b64d5c8a69dfd49cb19c44>
  - UIResponder 클래스 내 .resignFirstResponder 메서드를 사용해서 키보드 비활성화 구현
    +  textField에 First 응답 객체(앱 화면으로 들어오면 가장 먼저 유저한테 포커스 해줌.)를 지정.
       텍스트필드에 지정했으니 포커스 되면서 키보드가 올라옴. (반대로 내려가게 하는거는 .resignFirstResponder 메서드 실행)
  - 빈 화면 클릭시 키보드 비활성화 연습. (UITapGestureRecognizer 메서드 활용)
  - 숫자입력 불가 및 글자수 10자리 제한 기능 구현 (.shouldChangeCharactersIn 메서드 활용)
