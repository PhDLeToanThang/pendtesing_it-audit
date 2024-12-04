# Pendtesting là lĩnh vực kiểm thử cho nhiều sản phẩm, dịch vụ CNTT và Viễn thông ở trạng thái: 
## _Tìm về Nguyên gốc của Giá trị sản phẩm dịch vụ "Proof of concept - viết tắt: P.o.C"_

# Hướng dẫn & danh sách kiểm tra thâm nhập
_Tham khảo: https://www.belfercenter.org/publication/cybersecurity-campaign-playbook_

## Tổng quan

Một hướng dẫn toàn diện về kiểm tra thâm nhập có đạo đức, được thiết kế tỉ mỉ để bao gồm tất cả các giai đoạn của một cuộc kiểm tra thâm nhập. Danh sách kiểm tra từng bước này đảm bảo bao quát toàn diện từ khâu chuẩn bị đến báo cáo, lý tưởng cho cả người kiểm tra mới vào nghề và có kinh nghiệm.

---

## Mục lục

1. [Trước khi tham gia](#1-trước khi tham gia)
2. [Thu thập thông tin](#2-thu thập thông tin)
3. [Phân tích lỗ hổng](#3-phân tích lỗ hổng)
4. [Khai thác](#4-khai thác)
5. [Sau khi khai thác](#5-sau khi khai thác)
6. [Báo cáo](#6-báo cáo)
7. [Xác minh khắc phục](#7-xác minh khắc phục)
8. [Cân nhắc kiểm tra chuyên biệt](#8-cân nhắc kiểm tra chuyên biệt)
9. [Các nguồn lực bổ sung](#9-nguồn lực bổ sung)
10. [Đóng góp](#10-đóng góp)

---

## 1. Trước khi tham gia

### Pháp lý và tuân thủ

- [ ] Đảm bảo **Thỏa thuận bảo mật (NDA)**.
- [ ] Xin **giấy phép chính thức, bằng văn bản** để thử nghiệm.
- [ ] Đảm bảo **tuân thủ pháp lý** tất cả các luật và quy định có liên quan (ví dụ: GDPR, HIPAA).
- [ ] Xin **phạm vi bảo hiểm** phù hợp (ví dụ: bảo hiểm trách nhiệm nghề nghiệp).
- [ ] Thiết lập **thỏa thuận bảo mật** bổ sung nếu cần.

### Định nghĩa phạm vi

- [ ] Thu thập **thông tin toàn diện về khách hàng và hệ thống**.
- [ ] Xác định rõ **phạm vi và quy tắc tham gia**:
- Xác định các hệ thống và ứng dụng **trong phạm vi** và **ngoài phạm vi**.
- Xác nhận bất kỳ **hạn chế hoặc ràng buộc** nào (ví dụ: cửa sổ thử nghiệm, hệ thống nhạy cảm).
- [ ] Đồng ý về **phương pháp và công cụ thử nghiệm có thể chấp nhận được**.
- [ ] Thiết lập **thời gian thử nghiệm an toàn** để giảm thiểu tác động đến doanh nghiệp.
- [ ] Xác định **hệ thống của bên thứ ba** và xin các quyền cần thiết.

### Giao tiếp và lập kế hoạch

- [ ] Đặt **tiêu chí thành công cụ thể, có thể đo lường được**.
- [ ] Thiết lập **liên hệ khẩn cấp** và **giao thức phản hồi**.
- [ ] Xác định **giao thức lưu trữ và xử lý dữ liệu**:
- Thỏa thuận về cách **dữ liệu nhạy cảm** sẽ được lưu trữ, truyền tải và hủy bỏ.
- [ ] Thỏa thuận về **kênh liên lạc** và **tần suất báo cáo** với khách hàng:
- Thiết lập **kiểm tra** thường xuyên và **cập nhật tiến độ**.
- [ ] Làm rõ **lịch trình thử nghiệm** và **khung thời gian**.
- [ ] Đảm bảo nhóm thử nghiệm thâm nhập có **kỹ năng và chứng chỉ** cần thiết.

---
## 2. Thu thập thông tin

### Do thám thụ động

- [ ] Thực hiện **tra cứu WHOIS** và phân tích thông tin đăng ký tên miền.
- [ ] Thực hiện **phân tích DNS** và liệt kê các tên miền phụ.
- [ ] Thực hiện **thu thập thông tin thụ động** (ví dụ: Shodan, Censys).
- [ ] Sử dụng các kỹ thuật **Trí tuệ nguồn mở (OSINT)**:
- Thu thập thông tin từ **mạng xã hội**, **diễn đàn công khai** và **các vi phạm trong quá khứ**.
- Xem xét **các bài đăng tuyển dụng** để tìm hiểu sâu hơn về các công nghệ và hệ thống được sử dụng.
- Kiểm tra **kho lưu trữ mã** (ví dụ: GitHub) để tìm mã hoặc thông tin xác thực bị lộ.
- [ ] Phân tích **chứng chỉ SSL/TLS** để biết thông tin chi tiết về đơn vị phát hành và ngày hết hạn.
- [ ] Thực hiện **Google dorking** để tìm thông tin có khả năng nhạy cảm.

### Giám sát chủ động

- [ ] Thực hiện **quét mạng và ứng dụng** (ví dụ: Nmap, Nessus).
- [ ] Xác định và liệt kê tất cả **tên miền phụ**.
- [ ] Thực hiện **thu thập dữ liệu web** để tìm nội dung ẩn hoặc động.
- [ ] Lập bản đồ **cấu trúc mạng** và xác định các thiết bị mạng.
- [ ] Xác định **công nghệ**, **nền tảng** và **khung** được sử dụng trong các ứng dụng.
- [ ] Tìm kiếm **lỗ hổng phổ biến** (ví dụ: thông tin xác thực mặc định, hệ thống chưa vá).
- [ ] Kiểm tra **rò rỉ thông tin** qua siêu dữ liệu, bình luận HTML, v.v.

### Cơ hội kỹ thuật xã hội

- [ ] Đánh giá các cơ hội và phương pháp cho **kỹ thuật xã hội**:
- Theo dõi **nền tảng truyền thông xã hội** để biết thông tin tiết lộ liên quan đến công ty.
- Thu thập **thông tin về nhân viên và tổ chức** từ các nguồn công khai.

---
## 3. Phân tích lỗ hổng

### Quét tự động

- [ ] Xác thực và ưu tiên các phát hiện từ **quét tự động**.
- [ ] Kiểm tra **các lỗ hổng đã biết** và các khai thác có thể xảy ra.
- [ ] Sử dụng **các công cụ đánh giá lỗ hổng** để xác định các vấn đề tiềm ẩn.

### Kiểm tra thủ công

- [ ] Phân tích các ứng dụng để tìm các lỗi phổ biến:
- **Tiêm SQL (SQLi)**
- **Tập lệnh chéo trang (XSS)**
- **Làm giả yêu cầu chéo trang (CSRF)**
- **Tham chiếu đối tượng trực tiếp không an toàn (IDOR)**
- **Hủy tuần tự hóa không an toàn**
- [ ] Thực hiện **kiểm tra mờ** để phát hiện các lỗ hổng mới.
- [ ] Xem xét **cấu hình máy chủ và ứng dụng** để tìm lỗi cấu hình.
- [ ] Thực hiện **đánh giá mã thủ công** khi có thể.
- [ ] Đánh giá **cơ chế xác thực** và **ủy quyền**.
- [ ] Kiểm tra **lộ dữ liệu nhạy cảm** (ví dụ: trong URL, phản hồi API).
- [ ] Kiểm tra **quản lý phiên** để tìm điểm yếu như cố định phiên.

### Mạng và Cơ sở hạ tầng

- [ ] Kiểm tra cấu hình bảo mật không đúng trong **thiết bị mạng** (tường lửa, bộ định tuyến).
- [ ] Đánh giá **thực hành mã hóa và mật mã**, bao gồm cấu hình SSL/TLS.
- [ ] Đánh giá **API** để tìm lỗ hổng như xác thực không đúng.
- [ ] Đánh giá **kiểm soát ghi nhật ký và giám sát** để biết hiệu quả.
- [ ] Kiểm tra **các thành phần và thư viện của bên thứ ba** để tìm lỗ hổng.

### Tuân thủ và Tiêu chuẩn

- [ ] Xác minh việc tuân thủ các tiêu chuẩn của ngành (ví dụ: **OWASP Top Ten**, **NIST**).
- [ ] Đánh giá việc tuân thủ **chính sách bảo mật** và **quy trình** của tổ chức.
- [ ] So sánh các phát hiện với **yêu cầu tuân thủ** (ví dụ: PCI DSS, ISO 27001).

---
## 4. Khai thác

### Truy cập ban đầu

- [ ] Cố gắng giành quyền truy cập ban đầu thông qua:
- **Chiến dịch lừa đảo** (có sự cho phép rõ ràng).
- Khai thác **các lỗ hổng đã biết**.
- Sử dụng **thông tin xác thực mặc định hoặc yếu**.
- [ ] Sử dụng **khung khai thác** (ví dụ: Metasploit) một cách có trách nhiệm và trong phạm vi.

### Tăng đặc quyền

- [ ] Thực hiện **tăng đặc quyền** trên các hệ thống bị xâm phạm.
- [ ] Khai thác **lỗ hổng logic ứng dụng** và **lỗ hổng logic kinh doanh**.

### Di chuyển ngang

- [ ] Khám phá **các di chuyển ngang** trong mạng.
- [ ] Cố gắng truy cập các hệ thống và tài nguyên khác.

### Trốn tránh bảo mật

- [ ] Cố gắng **bỏ qua các biện pháp kiểm soát bảo mật** như WAF, 2FA, v.v.
- [ ] Cố gắng **tránh bị phát hiện** bởi các giải pháp bảo mật (ví dụ: phần mềm diệt vi-rút, IDS/IPS).
- [ ] Sử dụng **các khai thác tùy chỉnh hoặc zero-day** một cách thận trọng và có sự cho phép rõ ràng.

### Tài liệu

- [ ] Ghi lại tỉ mỉ từng bước của quy trình khai thác.
- [ ] Duy trì **nhật ký chi tiết về tất cả các hành động** để giải trình và phân tích.
- [ ] Đảm bảo tất cả các bước khai thác đều **có thể tái tạo** và **có thể xác minh**.

---
## 5. Hậu khai thác

### Phân tích tác động

- [ ] Xác định và truy cập **kho dữ liệu quan trọng**.
- [ ] Phân tích **tác động kinh doanh và kỹ thuật** tiềm ẩn của các lỗ hổng bị khai thác.
- [ ] Đánh giá **khả năng khai thác trong thế giới thực** dựa trên các phát hiện.

### Tính bền bỉ và dọn dẹp

- [ ] Triển khai các chiến lược để **duy trì quyền truy cập**, nếu cần thiết và được ủy quyền.
- [ ] **Xóa tất cả các công cụ**, tập lệnh và hiện vật được sử dụng trong quá trình thử nghiệm.
- [ ] Đảm bảo không còn **cửa hậu**, tài khoản thử nghiệm hoặc cơ chế bền bỉ nào.
- [ ] Xác minh rằng hệ thống đã **khôi phục** về trạng thái trước khi thử nghiệm.
- [ ] Xác nhận rằng không có **dữ liệu nhạy cảm** nào bị thay đổi hoặc bị lộ.

### Xử lý dữ liệu

- [ ] Tuân thủ **quy trình xử lý dữ liệu** và **quy trình xử lý** an toàn.
- [ ] Kiểm tra **thông tin xác thực dạng văn bản rõ** và dữ liệu nhạy cảm trong bộ nhớ.
- [ ] Mô phỏng **thâm nhập dữ liệu**, nếu nằm trong phạm vi đã thỏa thuận.

### Tài liệu

- [ ] Ghi lại tất cả **thay đổi hệ thống** một cách toàn diện.

---

## 6. Báo cáo

### Chuẩn bị báo cáo

- [ ] Tạo **báo cáo kỹ thuật** chi tiết ghi lại các công cụ, kỹ thuật và quy trình đã sử dụng.
- [ ] Bao gồm **bằng chứng** như ảnh chụp màn hình và nhật ký.
- [ ] Cung cấp **khuyến nghị khắc phục** rõ ràng, có thể thực hiện được.
- [ ] Chỉ định **xếp hạng rủi ro** cho tất cả các lỗ hổng đã xác định.
- [ ] Thực hiện theo các định dạng báo cáo theo tiêu chuẩn của ngành (ví dụ: **PTES**, **hướng dẫn của NIST**).
- [ ] Bao gồm **phần phương pháp** chi tiết giải thích về cách tiếp cận thử nghiệm.
- [ ] Cung cấp tài liệu tham khảo về **tiêu chuẩn của ngành** và **các biện pháp thực hành tốt nhất** có liên quan.

### Tóm tắt nội dung

- [ ] Chuẩn bị **tóm tắt nội dung** để các bên liên quan xem xét.
- [ ] Bao gồm cả **chi tiết kỹ thuật** và **tổng quan cấp cao** cho các đối tượng khác nhau.

### Phân loại và Bảo mật

- [ ] Đảm bảo báo cáo được **phân loại phù hợp** và dữ liệu nhạy cảm được bảo mật.
- [ ] Đưa ra **kế hoạch hành động** được ưu tiên với mốc thời gian rõ ràng để khắc phục.

### Giao tiếp với Khách hàng

- [ ] Tiến hành **cuộc họp đọc báo cáo** với khách hàng để thảo luận về những phát hiện chính.
- [ ] Đề xuất mốc thời gian cho **đánh giá tiếp theo** hoặc kiểm tra lại.

---

## 7. Xác minh khắc phục

### Kiểm tra lại

- [ ] Cho khách hàng một khoảng thời gian được chỉ định để **khắc phục các sự cố đã xác định**.
- [ ] Tiến hành **kiểm tra lại** để xác minh hiệu quả của các bản sửa lỗi.
- [ ] **Cập nhật báo cáo** với kết quả xác minh và bất kỳ phát hiện mới nào.
- [ ] Xác thực rằng **các biện pháp kiểm soát bảo mật** hiện đang hoạt động như mong đợi.

### Các vấn đề chưa được giải quyết

- [ ] Ghi lại bất kỳ **vấn đề bảo mật chưa được giải quyết** nào.
- [ ] Đề xuất các chiến lược để **giám sát liên tục** và cải thiện.

### Cải tiến liên tục

- [ ] Hỗ trợ xác định **nguyên nhân gốc rễ** để ngăn ngừa các lỗ hổng trong tương lai.
- [ ] Đề xuất cải tiến **chính sách**, **quy trình** và **thực hành bảo mật**.
- [ ] Đề xuất tích hợp bảo mật vào **vòng đời phát triển phần mềm**.
- [ ] Tư vấn về nhu cầu **nhận thức bảo mật** và **chương trình đào tạo**.
- [ ] Đề xuất lịch trình cho các cuộc **kiểm toán bảo mật** thường xuyên trong tương lai.
- [ ] Cung cấp hướng dẫn về việc triển khai **chương trình quản lý lỗ hổng**.

---
## 8. Cân nhắc kiểm tra chuyên biệt

### Kiểm tra thiết bị IoT

- [ ] **Phân tích chương trình cơ sở** để tìm lỗ hổng.
- [ ] Đánh giá **bảo mật giao thức truyền thông** (ví dụ: MQTT, CoAP).
- [ ] Thực hiện **kiểm tra bảo mật phần cứng** (ví dụ: giao diện JTAG, UART).
- [ ] Đánh giá **bảo mật cập nhật qua mạng (OTA)**.
- [ ] Kiểm tra **cấu hình mặc định** và thông tin xác thực được mã hóa cứng.
- [ ] Đánh giá **bảo mật truyền thông RF** (ví dụ: Bluetooth, Zigbee).
- [ ] Xem lại **các biện pháp kiểm soát bảo mật vật lý**.

### Bảo mật container

- [ ] Phân tích **cấu hình bảo mật Docker**.
- [ ] Đánh giá **bảo mật cụm Kubernetes**.
- [ ] Thực hiện **quét hình ảnh container** để tìm lỗ hổng.
- [ ] Triển khai **giám sát bảo mật thời gian chạy**.
- [ ] Xem lại **cấu hình lưới dịch vụ**.
- [ ] Đánh giá **bảo mật dàn dựng container**.
- [ ] Bảo mật **sổ đăng ký container**.

### Bảo mật đường ống CI/CD

- [ ] Bảo mật hệ thống **quản lý mã nguồn**.
- [ ] Đánh giá **bảo mật đường ống xây dựng**.
- [ ] Bảo vệ **kho lưu trữ hiện vật**.
- [ ] Bảo mật **quy trình triển khai**.
- [ ] Đánh giá **bảo mật Cơ sở hạ tầng dưới dạng Mã (IaC)**.
- [ ] Triển khai các biện pháp thực hành tốt nhất **quản lý bí mật**.
- [ ] Thực thi **kiểm soát truy cập đường ống**.

### Cơ sở hạ tầng đám mây

- [ ] Thực hiện **đánh giá cấu hình đám mây**.
- [ ] Đánh giá **chính sách Quản lý danh tính và truy cập (IAM)**.
- [ ] Bảo mật **dịch vụ lưu trữ** (ví dụ: thùng S3, lưu trữ Blob).
- [ ] Xem lại **nhóm bảo mật mạng** và cài đặt tường lửa.
- [ ] Đánh giá **bảo mật chức năng không có máy chủ**.
- [ ] Kiểm tra **cấu hình sai** trong môi trường đám mây.
- [ ] Đánh giá **lỗ hổng bảo mật** và khai thác cụ thể của đám mây.

---

## 9. Tài nguyên bổ sung

- **Hướng dẫn kiểm tra OWASP**
- Hướng dẫn toàn diện để kiểm tra tính bảo mật của các ứng dụng web.
- [Hướng dẫn kiểm tra OWASP](https://owasp.org/www-project-web-security-testing-guide/)

- **NIST SP 800-115**
- Hướng dẫn kỹ thuật về kiểm tra và đánh giá bảo mật thông tin.
- [NIST SP 800-115](https://csrc.nist.gov/publications/detail/sp/800-115/final)

- **Tài nguyên kiểm tra thâm nhập đám mây**
- **Hướng dẫn kiểm tra thâm nhập AWS**
- [Hướng dẫn kiểm tra thâm nhập AWS](https://aws.amazon.com/security/penetration-testing/)
- **Kiểm tra thâm nhập Azure**
- [Quy tắc tham gia kiểm tra thâm nhập đám mây của Microsoft](https://learn.microsoft.com/en-us/azure/security/fundamentals/pen-testing)
- **Kiểm tra thâm nhập Google Cloud Platform (GCP)**
- [Hướng dẫn kiểm tra thâm nhập GCP](https://support.google.com/corporate-suppliers/answer/14435909?hl=en)

- **Kiểm tra bảo mật di động**
- **Hướng dẫn kiểm tra bảo mật di động OWASP**
- Hướng dẫn chi tiết để kiểm tra bảo mật ứng dụng di động.
- [OWASP MSTG](https://owasp.org/www-project-mobile-security-testing-guide/)

---

## 10. Đóng góp

Chúng tôi hoan nghênh và đánh giá cao các đóng góp. Vui lòng gửi yêu cầu kéo hoặc các vấn đề để cải thiện.

### Nguyên tắc đóng góp

- [ ] Đảm bảo các đóng góp **phù hợp với các tiêu chuẩn của ngành** và các thông lệ tốt nhất.
- [ ] Cung cấp mô tả rõ ràng và ngắn gọn về các thay đổi được đề xuất.

---

**Lưu ý:** Danh sách kiểm tra này dành cho thử nghiệm thâm nhập được ủy quyền được thực hiện với sự đồng ý phù hợp và tuân thủ mọi luật và quy định hiện hành.

---

Bằng cách làm theo hướng dẫn toàn diện này, những người thử nghiệm thâm nhập có thể đảm bảo một cách tiếp cận toàn diện đối với các đánh giá bảo mật, phù hợp với các tiêu chuẩn của ngành.
