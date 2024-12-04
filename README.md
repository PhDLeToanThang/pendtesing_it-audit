# iAM Platform:
## 1. identity access management platform - 5 layers (idP - SP)##
----
Tham khảo 1: Ưu tiên dùng Giao thức kết nối OpenID https://openid.net/connect/faq/

Tham khảo 2: Ưu tiên dùng các tham số và giao thức kiểm tra xác thực oAuth2: https://oauth.net/2/refresh-tokens/ 

Tham khảo 3: Dùng Công cụ Postman để kiểm tra, lấy kết quả làm mẫu XML/XSD/JSON để xây dựng Web API services cho kiểu Web API call Web API: https://postman.com/download

Tham khảo 4: Lựa chọn phần tuỳ biến sửa code các trang Login / Sign-in / Logout / Sign-out hoặc Check Refresh URL/ Refresh Token URL theo các dạng ngôn ngữ lập trình Web page: 

ví dụ 1: PHP với OpenID: https://bitbucket.org/PEOFIAMP/phpoidc/src/master/

Tham khảo 5: Tìm hiểu và xây dựng Hệ thống quản lý tập trung trên AD Server giúp phát triển hạ tầng Quản lý Danh tính, bảo mật, xác thực tập trung bằng MS-AD-DC/AD-DS/AD-CA  hoặc IPA:  https://www.freeipa.org/page/Main_Page

ví dụ 2: https://github.com/causefx/Organizr/tree/v2-master/api/functions

ví dụ 3: Tạo cấu hình LDAP/OpenLDAP cho Portal PHP: https://docs.organizr.app/features/authentication-backends/ldap-backend

----
# Phân tích dự án cần MFA và kích hoạt các phương thức xác thực 2 yếu tố "2FA" hoặc đa yếu tố "Multi Factors Authenticator":

## A. Thảo luận 1:
Hãy hướng dẫn chi tiết từng bước để tôi có thể cài và cấu hình Microsoft MFA và cấu hình để có hình thức TOTP pin code?

1.1. Gửi qua Email Device hoặc  (ưu tiên cách này do triển khai trên Server Side và Admin thống nhất quy trình quản trị).

1.2. Gửi qua một App/Web Portal có QRcode để người dùng tự đăng ký API vs Secret Key sau đó tự nhận TOTP qua App/Web Gateway. (Tự triển khai trong Local/On-prem)

1.3. Gửi qua một (01) device App chuỗi TOTP và Pincode (ưu tiên tiếp theo cách này do có sẵn từ Microsoft Entra ID, Microsoft Authenticator App, Google Authenticator, Citrix ...)

1.4. Không gửi bất cứ thông tin gì cho người dùng (Not Human), chỉ dùng NTP, GPRS, GPS, GIS và chuỗi Token để tương tác với thiết bị (interactive Device Token) như: Yubikey... tự trả lời Token hợp lệ khi cắm USB Token vào PC (Không ưu tiên cách này phát sinh chi phí mua, duy trì token software management hàng tháng/năm. Phần mềm Token Manager vẫn có thể bị hacker tấn công).

1.5. Gửi qua một Application Clien Agent (phải cài trên Trình duyệt của máy PC client ví dụ: Last Password cho Firefox, Chrome, Edge, Safari .... Nhược điểm lỗ hổng client phải được auto vá lỗi ... không ưu tiên cách này).

## B. Thảo luận 2:
2.1. Các chính sách bảo mật, an ninh an toàn thông tin và luật riêng tư cá nhân người dùng trong một tổ chức Doanh nghiệp, loại hình Doanh nghiệp:

- ví dụ: FDI vốn Nhật bản, Hàn Quốc...

2.2. Hình thức tổ chức lĩnh vực hoạt động Doanh nghiệp:

- ví dụ: In ấn thiết kế tài liệu: AbeHN,  CNC/CAD-CAM... trong sản xuất sản phẩm công nghệ cao: STV ...)

3. Các thiết bị ngoại vi có đấu nối, chuyền dữ liệu trực tiếp hoặc gián tiếp qua:

3.1. Bluetooth transfer files hoặc NFC replicate...,

3.2. SMPP SMS topup..., 

3.3. Via Push/Pull thông tin trên màn hình lệnh, Ví điện tử, 

3.4. Link Phone for OS, 

3.5. USB Token (xác thực SSL/TLS/RSA/PPK / Kê khai thuế/ Kê khai Hải Quan...), 

3.6. Điện thoại Voice IP hoặc 2G/3G/4G/5G/6G... , 

3.7. Máy ảnh thường hoặc số, 

3.8. USB External to disk storage, 

3.9. USB re-direct to CDROM R/W/Blueray/Flash disk/Smart disk/smart card..., 

3.10. Máy quay hình Video thường hoặc số... 

3.11. Máy chiếu Projects, máy in màn hình Printer, máy in vật thể Scanner Objects, máy 3D VR/Hololen/Glass 3D, Phần mềm điều khiển và quản lý máy in...

3.12. Máy biên dịch/phiên dịch/thông dịch, ghi âm, dịch thuật tự động và chuyển đổi ngôn ngữ từ âm thanh/hình ảnh các cuộc họp...

3.13. Các Log system ghi nhật ký tự động, bán tự động, hoặc thủ công từ: các HĐH của máy người dùng, thiết bị IoT, Phần mềm của người dùng cá nhân...

3.14. Các Log system ghi nhật ký của các máy chủ vật lý, ảo hoá, network, storage services , DCV , Firewall, Gateway, LBN.... là hệ thống máy chủ dịch vụ được miễn trừ bàn tới trong chủ đề này (yếu tố miễn bàn, bắt buộc phải có màn quản lý, phân tích hành vi, thu thập dữ liệu, bằng chứng xác minh.... của  quản trị và Kiểm toán CNTT)

**Lưu ý:** 
- Trong danh sách các thiết bị cấm sử dụng tại Doanh nghiệp sản xuất hoặc chỉ định cụ thể cho cá nhân hoặc nhóm/tổ "User/Group/co-hort" được phép sử dụng trong mục đích cụ thể có giám sát hành vi, dữ liệu phần mềm...
- Ảnh hưởng tuyệt đối tới chính sách cấu hình công nghệ 2FA (bất buộc phải kích hoạt sửa dụng MFA).
- Do vậy, cần sự linh hoạt trong cấu hình 2FA để đạt được sự phù hợp khi áp dụng MFA với 2FA đảm bảo an ninh an toàn thông tin đồng thời áp dụng phù hợp với chính sách của Doanh nghiệp yêu cầu đề ra.

## C. Thảo luận 3:
### 4.1. Biện luận 1. Xác thực MFA đa yếu tố (nhiều hình thức xác thực)?
- MFA là bắt buộc hiện nay. (Mục tiêu: tăng cường bảo mật thông tin người dùng).
- SSO là tùy chọn, do mục tiêu: xác thực thiết kế 01 lớp nhập username hoặc email và mật khẩu để "tiện lợi, dễ dùng, mọi thứ cố định trong 1 khoảng thời gian".
- MFA - 2FA là một cách để kích hoạt xác thực 2 yếu tố cố định như: Địa chỉ email cụ thể, số điện thoại cố định.

### 4.2. Rủi ro của kiểu xác thực MFA với 2FA:
- Cách xác thực MFA với 2FA bị hạn chế với hình thức devices, nó cố định trong 1 phương thức cụ thể không có nhiều lựa chọn phương thức phù hợp chính sách.
- Trong khi các chính sách bảo mật, an ninh an toàn thông tin còn phu thuộc vào Quy trình hoạt động của Doanh Nghiệp để đưa ra các chính sách riêng của DN.
- Độ khó của MFA với quản lý MFA có nhiều Factors sẽ là ưu tiên phù hợp linh hoạt cho các chính sách riêng của Doanh nghiệp, thậm trí là quá độ trong từng giai đoạn để chuyển đổi chính sách mới nâng cao hơn về an toàn CNTT.

Như vậy, nếu triển khai MFA và Multi Factors "đa yếu tố xác thực/ nhiều kiểu-phương thức xác thực" sẽ linh hoạt hơn cho Admin và người dùng trong Doanh nghiệp, tiến đến tích hợp xác thực 1 lần "SSO -LDAPs" tính thống nhất cao trong Quản lý, cấp phát và xác thực danh tính người dùng 1 lần.

## D. Phân loại cách thức triển khai MFA và Multi-Factors:
### 5.1. Trường hợp 1. MFA cho từng ứng dụng cụ thể triển khai khả thi:
#### 5.1.1. Màn hình Portal Workspace cho từng use người dùng có màn Pincode TOTP của Web/Outlook Email 

5.1.2. Ví dụ 1. Moodle - Elearning - LMS tích hợp với Source code/Plugin: MFA-TOTP.  (https://mooc.cloud.edu.vn)

5.1.3. Ví dụ 2. GLPI - ITSM/ITSAM tích hợp với Source code/Plugin: MFA-TOTP.  (https://itsm.atcom.vn )

5.1.4. Ví dụ 3. SEO - tích hợp với Source code/Plugin: MFA -TOTP. ( https://seo.cloud.edu.vn )

5.1.5. Đề xuất mỗi người dùng đều có màn màn Authenticator Multi-Factor và Multi-Apps TOTP để tự được quyền nhận PinCode cho mình dùng Web/Outlook Email (trên Thiết bị Smart phone cài Microsoft Authneticator của Doanh nghiệp, phù hợp với chính sách của Doanh nghiệp cho phép tự mua sắm và sử dụng công khai). 

### 5.2. Trường hợp 2. MFA cho từng ứng dụng cụ thể triển khai khả thi nhưng chính sách sử dụng 2FA của Doanh nghiệp không cho phép:
#### 5.2.1. Đề xuất màn Authenticator Multi-Factor và Multi-User TOTP để một số trong nhóm Leaders/Co-hort được quyền cung cấp PinCode cho người dùng Web/Outlook Email (trên Thiết bị Tablet/ipad đặt tại Bộ phận IT Audit của Doanh nghiệp). 
### - Rủi ro:
5.2.1.1. Quá nhiều người yêu cầu khi login Web/Outlook, IT Audit bận lo việc khác không hồi đáp thông tin pincode thay đổi sau 30s.

5.2.1.2. Nếu đã thêm Authenticator xác thực OuAth hoặc Software TOTP của mọi người vào cùng 1 thiết bị đặt lại Doanh nghiệp, thì các dịch vụ Web/Outlook bắt xác thực bằng 2FA sẽ không thể thêm ở nới khác (ví dụ: nhà riêng hoặc thiết bị xác thực thứ 3 cho cá nhân người dùng).

5.2.1.3. Màn hình để tiếp nhận Multi-factor cho multi-user TOTP phải đủ lớn vì rất nhiều dòng TOTP xuất hiện cùng lúc, phải tra cứu tìm kiếm theo người dùng nên phải ghi thông tin đăng ký App Auth dễ hiểu, chính xác, Phải backup thường xuyên các RSA Token Encryption của người dùng để tránh sự cố mất dữ liệu Vault Keys...

### 5.2.2. Đề xuất dùng Khóa cứng HOTP như yubikey/HOTP token/TrustedKey...  
### - Rủi ro: 
5.2.2.1. Chính sách chặn dùng USB sẽ khó đảm bảo khi mọi người đều dùng USB Token.

5.2.2.2. Các USB key đều cần có Token Manager để quản lý/xóa/sửa/thu hồi/renew CA nên vẫn phải vá lỗi nâng cấp bảo mật SSL/TLS token.

5.2.2.3. Chi phí token key cao, Vẫn phải duy trì bảo hành, Phải backup thường xuyên các RSA Token Encryption của người dùng để tránh sự cố mất dữ liệu Vault Keys...

### 5.3. Trường hợp 3. MFA khó cấu hình và tích hợp TOTP cho các ứng dụng Code đóng, không có source code để sửa.
#### 5.3.1. Màn hình Portal Workspace cho từng use người dùng có màn Pincode TOTP của Web/Outlook Email 

5.3.2. Ví dụ 3. Cloud Edge - Remote Control Cloud tích hợp MFA - TOTP source code/Plugin: MFA-TOTP 

#### - Hệ thống Điện toán này quản lý các kết nối Remote tới Máy Chủ Ảo/ HĐH máy client đã cài các phần mềm (không có source code để sửa).
Lưu ý: Các phần mềm trên vẫn cho phép cài lại, cài mới trên các HĐH phiên bản cũ 32/64bit ví dụ: Windows XP/Win7/8x/10x/11x/12x hoặc 2k3 64bit/ 2k8 x64bit/2k12 x63bit/2k16/2k19/2k22... Linux x64bit.

#### - Hệ thống giải pháp "Điện toán ứng dụng - Cloud App" hoặc Web hóa toàn bộ ứng dụng theo chuẩn HTML5 hoặc K8s sẽ giúp tích hợp MFA và TOTP trên tầng Portal Workspace của người dùng, dẽ dàng tích hợp SSO - LDAPs ở tầng ứng dụng phần mềm (không có source code để sửa) vì cấu hình giữa HĐH của máy người dùng và Windows Authenticate Apps là có sẵn các phương thức cấu hình bypass hoặc Use Passkey dựa trên thư viện phần mềm hãng thứ 3 với HĐH ví dụ: Github, Google, Linkedin Login với Windows Authenticate.
