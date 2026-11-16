-- Bài: Thiết kế Mô hình Dữ liệu Quản lý Phim
CREATE DATABASE IF NOT EXISTS quan_ly_phim CHARACTER SET utf8mb4;
USE quan_ly_phim;

CREATE TABLE PHIM (
  ma_phim     VARCHAR(10)  PRIMARY KEY,
  ten_phim    VARCHAR(255) NOT NULL,
  thoi_luong  INT          NOT NULL COMMENT 'Đơn vị: phút',
  noi_dung    TEXT,
  dien_vien   VARCHAR(500),
  dao_dien    VARCHAR(255)
);

CREATE TABLE THE_LOAI (
  ma_the_loai  VARCHAR(10)  PRIMARY KEY,
  ten_the_loai VARCHAR(100) NOT NULL UNIQUE,
  trang_thai   BOOLEAN      NOT NULL DEFAULT TRUE COMMENT 'TRUE: đang hoạt động, FALSE: ẩn'
);

CREATE TABLE PHIM_THE_LOAI (
  ma_phim     VARCHAR(10),
  ma_the_loai VARCHAR(10),
  PRIMARY KEY (ma_phim, ma_the_loai),
  FOREIGN KEY (ma_phim)     REFERENCES PHIM(ma_phim)         ON DELETE CASCADE,
  FOREIGN KEY (ma_the_loai) REFERENCES THE_LOAI(ma_the_loai) ON DELETE CASCADE
);
