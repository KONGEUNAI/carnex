const images = [
    'images/photo1.jpg',
    'images/photo2.jpg',
    'images/photo3.jpg',
    'images/photo4.jpg',
    'images/photo5.jpg',
    'images/photo6.jpg',
    'images/photo7.jpg',
    'images/photo8.jpg',
    'images/photo9.jpg',
    'images/photo10.jpg',
    'images/photo11.jpg',
    'images/photo12.jpg',
    'images/photo13.jpg',
    'images/photo14.jpg',
    'images/photo15.jpg',
    'images/photo16.jpg',
    'images/photo17.jpg',
    'images/photo18.jpg',
    'images/photo19.jpg',
    'images/photo20.jpg',
    'images/photo21.jpg',
    'images/photo22.jpg',
    'images/photo23.jpg',
    'images/photo24.jpg',
    'images/photo25.jpg',
    'images/photo26.jpg',
    'images/photo27.jpg',
    'images/photo28.jpg',
    'images/photo29.jpg',
    'images/photo30.jpg',
    'images/photo31.jpg',
    'images/photo32.jpg',
    'images/photo33.jpg',
    'images/photo34.jpg',
    'images/photo35.jpg'
];

let currentIndex = 0;
const itemsToLoad = 6;
let loading = false;

const loadImages = () => {
    const contentDiv = document.getElementById('content');
    const loadingDiv = document.getElementById('loading');

    if (loading) return; // 로딩 중이면 함수 종료
    loading = true; // 로딩 시작

    loadingDiv.style.display = 'block';

    setTimeout(() => {
        let count = 0;

        // itemsToLoad만큼 이미지 로드
        while (count < itemsToLoad && currentIndex < images.length) {
            const box = document.createElement('li');
            const wrap = document.createElement('div');
            const title = document.createElement('h4');
            const txt = document.createElement('p');
            box.className = 'box';
            wrap.className = 'wrap';
            title.className = 'title';
            txt.className='contents';
            /* box.style.backgroundImage = `url('${images[currentIndex]}')`; */

            /* wrap.style.background = '#fc0'; // 테스트 색상 */
            /* txt.style.background='#06f'; // test
            title.style.background='#06f'; // test*/

            /* box.innerText = `Image ${currentIndex + 1}`; */

            title.innerText='현대 더 뉴 아반떼 하이브리드 (CN7) 스마트';
            txt.innerText='23/05식    (24년형)     13,130km    경기    사고유무 : 무';

            contentDiv.appendChild(box).appendChild(wrap);
            contentDiv.appendChild(box).appendChild(title);
            contentDiv.appendChild(box).appendChild(txt);
            
            currentIndex++;
            count++;
        }
        loadingDiv.style.display = 'none';
        loading = false; // 로딩 완료
    }, 1000);
};

const handleScroll = () => {
    const { scrollTop, clientHeight, scrollHeight } = document.documentElement;
    
    // 스크롤 바닥에 가까워질 때만 이미지 로드
    if (scrollTop + clientHeight >= scrollHeight - 100) {
        loadImages();
        $('.filter-none').removeClass('filter-none');
        $('.filter-none').addClass('filter');
    }
};

// 초기 이미지 로드
loadImages(); // 초기 로드에서 6개 이미지를 보여줌

// 스크롤 이벤트 리스너
window.addEventListener('scroll', handleScroll);
$(function() {
    $(window).scroll(function(){
        var height = $(window).scrollTop();
        console.log(height);

        if (height >= 1000) {
            $('section > .filter').addClass('fade-in');
        } 
        if (height < 500) {
            $('section > .filter').removeClass('fade-in');
        }
    });
});



function CountChecked(field) { // field객체를 인자로 하는 CountChecked 함수 정의
    const side1 = document.getElementById('side1'); // 복사할 대상 요소
    const parentUl = field.parentNode.parentNode; // 체크박스의 부모의 부모 요소 (ul 태그)

    if (field.checked) { // 만약 field의 속성이 checked 라면
      count += 1; // count 1 증가

      if (count > maxCount) { // 만약 count 값이 maxCount 값보다 큰 경우라면
        alert("최대 2개까지만 선택가능합니다!"); // alert 창을 띄움
        field.checked = false; // 체크 해제
        count -= 1; // count를 1 감소시켜 복구
        return;
      }

      const cloneElement = parentUl.cloneNode(true); // 부모의 부모 요소인 ul을 복제
      const cloneId = `clone-${parentUl.className}-${count}`; // 고유 clone ID 생성
      cloneElement.setAttribute("data-clone-id", cloneId); // clone에 데이터 속성으로 cloneId 추가

      side1.appendChild(cloneElement); // 복제된 요소를 side1에 추가
      field.setAttribute("data-clone-id", cloneId); // 체크박스에 cloneId를 저장
    } 
    else { // 체크박스가 해제된 경우
      count -= 1; // count를 1 감소
      const cloneId = field.getAttribute("data-clone-id"); // 체크박스에서 cloneId 가져오기
      const cloneToRemove = side1.querySelector(`[data-clone-id="${cloneId}"]`); // 해당 cloneId와 일치하는 요소 선택
      
      if (cloneToRemove) {
          side1.removeChild(cloneToRemove); // 복제된 요소 삭제
      }
      field.removeAttribute("data-clone-id"); // 체크박스의 cloneId 속성 제거
    }
  }