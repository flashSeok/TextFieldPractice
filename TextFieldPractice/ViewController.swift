//
//  ViewController.swift
//  TextFieldPractice
//
//  Created by 김현석 on 2022/07/29.
//

import UIKit

// 1) ⭐️ViewController 내에서 textField를 사용하려면 UITextFieldDelegeate 프로토콜을 채택해야 한다.⭐️
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2) ⭐️ textField의 대리자(delegate)를 ViewController로 설정.⭐️
        textField.delegate = self
        
        setUp()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    // UITextFieldDelegate 프로토콜을 채택했기 때문에 아래 선택적인 메소드를 실행할 수 있음.(선택사항) text치다보면 메서드 리스트들이 뜬다.
    // 텍스트필드의 입력을 시작할 때 호출하는 메서드(시작할지 말지의 여부를 허락하는 것)
    // 메서드 이름에 Should가 있다면 '허락할지 말지' 에 대한 것.
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // 필요하다면 로직 구현(조건에 따라서 허락할지 말지)
        
        return true
    }
    
    // 텍스트필드가 입력된 시점을 알려줌
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했음.")
    }
    
    // 텍스트필드에 입력된걸 전체 삭제를 허락할지 말지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true // false로 설정시 입력하면 오른쪽에 x버튼을 눌러도 전체삭제가 되지 않는다.
    }
    
    // 텍스트필드의 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출이 되고 (허락 여부)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print(string)
        
        // 숫자입력 불가.
        if Int(string) != nil {
            return false
        } else {
            // 글자수 10글자로 제한.
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            
            return newLength <= 10
        }
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할 것인지에 대한 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 끝날 때 호출(끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 끝났을 때 호출(시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("끝났다")
        textField.text = ""
    }
    
    
    func setUp() {
        // 바탕화면의 배경색 변경
        view.backgroundColor = UIColor.gray
        // 텍스트필드 선택시 키보드 타입 설정
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        // 앱 화면에 들어오자마자 키보드 활성화
        // First응답 객체를 지정해줌.(화면에서 일단 먼저 반응할 녀석)
        // textField가 First응답 객체가 되면 키보드가 올라옴.
        // 한마디로 유저한테 먼저 반을할 것을 포커스 해줌.
        textField.becomeFirstResponder()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        // 키보드가 내려감.
        textField.resignFirstResponder()
        
    }
    
    // 다른 곳 누르면 키보드 내려감.
    @objc func dismissKeyboard() {
        print(#function)
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
}

