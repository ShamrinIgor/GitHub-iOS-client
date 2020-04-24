import Foundation
import UIKit
import WebKit
import SafariServices

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!
    var urlSting: String!
    let myDataDetector: WKDataDetectorTypes = []
    
    override func loadView() {
        
//        let source = "document.body.style.background = \"#999\";"
//        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
//        let userContentController = WKUserContentController()
//        userContentController.addUserScript(userScript)
        
        let webConfiguration = WKWebViewConfiguration()
//        webConfiguration.userContentController = userContentController
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        view = webView
        webView.reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: urlSting)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
}
