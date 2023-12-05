position relative :  sẽ di chuyển dựa trên vị trí ban đầu của nó.
position absolute : sẽ được đặt dựa trên phần tử cha gần nhất có thuộc tính position không phải static.
position fixed : sẽ được đặt dựa trên cửa sổ trình duyệt và sẽ không di chuyển khi cuộn trang.

ví dụ : 
- relative 
<div style="position: relative; left: 20px; top: 10px;">
</div>
- Cách vị trí ban đầu về bên trái 20px và trên 10px
- absolute 

<div style="position: relative;">
  <div style="position: absolute; top: 30px; left: 50px;">
  </div>
</div>
- Vị trí đặt cách phần tử cha top 30px và left 50px


- fixed 

<div style="position: fixed; top: 0; right: 0;">
</div>
- vị trí cố định trên cùng bên phải
