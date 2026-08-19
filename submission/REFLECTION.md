# Reflection — Lab 19

**Tên:** Trần Đình Đăng
**Cohort:** A20-K2
**Path đã chạy:** lite

---

## Câu hỏi (≤ 200 chữ)

> Trên golden set 50 queries, mode nào thắng ở loại query nào (`exact` /
> `paraphrase` / `mixed`), và tại sao? Khi nào bạn **không** dùng hybrid
> (i.e. khi nào pure BM25 hoặc pure vector là lựa chọn đúng)?

**Hybrid thắng tổng thể** vì nó kết hợp ưu điểm của cả hai: BM25 bắt exact matches, vector bắt semantic similarity. Tuy nhiên:

- **`exact` queries** (từ khoá đúng trong corpus): BM25 thường thắng vì term matching trực tiếp, không cần semantic inference.
- **`paraphrase` queries** (diễn đạt lại, không có term trùng): Vector thắng vì embedding bắt ý nghĩa, không phải từ.
- **`mixed` queries** (kết hợp cả hai): Hybrid thắng rõ rệt nhờ RRF kết hợp cả hai signals.

**Không dùng hybrid khi:**
1. **Chỉ có 1 term cần exact match** → pure BM25 nhanh và đủ tốt.
2. **Query hoàn toàn paraphrase, corpus đa ngữ** → cần multilingual embedding model mới hiệu quả.
3. **Latency budget cực thấp** → hybrid tốn 2x inference time cho BM25 + vector.

Bài học quan trọng: hybrid không phải lúc nào cũng tốt hơn — nó là **default thông minh**, nhưng phải đo trên corpus của mình để chọn đúng.

---

## Điều ngạc nhiên nhất khi làm lab này

**Filtered-ANN recall = 1.00 vs post-filter recall = 0.00** ở filter chặt (4% corpus). Không có warning, không có exception — hệ thống âm thầm trả sai mà không ai biết. Bài học: phải test với filter chọn lọc mạnh, không chỉ filter trống.

---

## Bonus challenge

- [ ] Đã làm bonus (xem `bonus/`)
- [x] Pair work với: _<làm một mình>_
