<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 전체 스타일 초기화 */
        *,
        *::after,
        *::before {
            box-sizing: border-box;
        }

        /* 전체 페이지 스타일 */
        body {
            margin: 0;
            color: black;
            background-color: white;
            font-weight: 600;
            width: 100%;
            overflow-x: hidden;
        }

        /* 컨테이너 스타일 */
        .container {
            width: 100vw;
            height: 100vh;
            height: -webkit-fill-available;
            position: absolute;
            left: 0;
            top: 0;
            user-select: none;
            overflow: hidden;
        }

        /* 중앙 정렬 클래스 */
        .center {
            height: 100vh;
            position: absolute;
            left: 50%;
            top: 28%;
            transform: translate(-50%);
            user-select: none;
        }

        /* 카드 아이템 그룹 */
        .items {
            transform-origin: center 200vh;
            transform: rotate(0);
            user-select: none;
            display: flex;
        }

        /* 카드 아이템 */
        .item {
            position: absolute;
            user-select: none;
            cursor: pointer;
            transform: translateX(-50%);
        }

        /* 카드 스타일 */
        .card {
            display: block;
            width: 430px;
            height: 610px;
            color: #fff;
            user-select: none;
            border-radius: 17px;
            overflow: hidden;
            cursor: grab;
            position: relative;
            border: 10px solid #7754eb;
        }

        /* 이미지 스타일 */
        .image {
            padding: 5px;
            width: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            filter: grayscale(0);
            pointer-events: none;
        }

        /* 미디어 쿼리: 카드 크기 조정 */
        @media screen and (max-height: 1000px) {
            .card {
                width: 350px;
                height: 497px;
            }
        }

        @media screen and (max-height: 800px) {
            .card {
                width: 300px;
                height: 400px;
            }
        }

        /* 정보 스타일 */
        .info {
            position: absolute;
            z-index: 20;
            top: 10px;
            left: 10px;
        }

        /* 콜렉션 설명 스타일 */
        .col_description{
            position: relative;
        }
    </style>
</head>

<body>
    <main>
        <div class="container">
            <div class="center">
                <div class="items">
                    <div class="item">
                        <div class="card">
                            <img class="image" src="/img/down.png" />
                            <div class="col_description">글씨 잘 써지나 테스트입니다 좀 글씨를 길게 써볼게요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/aWh8R6jeAbmiB4TsF6CjYFrUsI8.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/3Tf8vXykYhzHdT0BtsYTp570JGQ.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/zxVEkxgreRkFkh1rBK85T2JyxFY.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/vKEBse3BPU7crfAjdPNaC6WePnO.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/mfnkSeeVOBVheuyn2lo4tfmOPQb.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/bCj4EfuehAlgBwVd3diyWyhuuau.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/aWh8R6jeAbmiB4TsF6CjYFrUsI8.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/3Tf8vXykYhzHdT0BtsYTp570JGQ.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/zxVEkxgreRkFkh1rBK85T2JyxFY.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/original/vKEBse3BPU7crfAjdPNaC6WePnO.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/mfnkSeeVOBVheuyn2lo4tfmOPQb.jpg" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="card">
                            <img class="image" src="https://www.themoviedb.org/t/p/w220_and_h330_face/bCj4EfuehAlgBwVd3diyWyhuuau.jpg" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
        integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/Draggable.min.js"
        integrity="sha512-G7Wpe/pbg+zjyyM9HgQY6kacLAy+580lmA8DUXmZtioTI5FkaCRoLOaCLoeblrZABs7KZFD03cfSV9j7nmwxfw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        // HTML 요소들을 배열로 가져옵니다.
        const images = gsap.utils.toArray(".item");

        // 이미지 총 개수를 imageSize 변수에 할당합니다.
        const imageSize = images.length;

        // 이미지 총 개수를 total 변수에 할당합니다.
        const total = images.length;

        // 이미지당 회전 각도를 계산합니다.
        const degree = 360 / total;

        const init = () => {
            const timeline = gsap.timeline();

            images.forEach((image, index) => {
                const sign = Math.floor((index / 2) % 2) ? 1 : -1;
                const value = Math.floor((index + 4) / 4) * 4;
                const rotation = index > imageSize - 3 ? 0 : sign * value;

                gsap.set(image, {
                    rotation: rotation,
                    scale: 0.5,
                });

                timeline.from(
                    image,
                    {
                        x: () => index % 2 ?
                            window.innerWidth + image.clientWidth * 4 :
                            -window.innerWidth - image.clientWidth * 4,
                        y: () => window.innerHeight - image.clientHeight,
                        rotation: index % 2 ? 200 : -200,
                        scale: 4,
                        opacity: 1,
                        ease: "power4.out",
                        duration: 1,
                        delay: 0.15 * Math.floor(index / 2),
                    },
                    0
                );

                let rotationAngle = index * degree;
                timeline.to(
                    image,
                    {
                        scale: 1,
                        duration: 0,
                    },
                    0.15 * (imageSize / 2 - 1) + 1
                );

                timeline.to(
                    image,
                    {
                        transformOrigin: "center 200vh",
                        rotation: index > imageSize / 2 ? -degree * (imageSize - index) : rotationAngle,
                        duration: 1,
                        ease: "power1.out",
                    },
                    0.15 * (imageSize / 2 - 1) + 1
                );

                // 만약 현재 인덱스가 중앙에 오도록 설정한 인덱스와 같다면 중앙으로 이동하는 애니메이션 추가
                if (index === selectedCardIndex) {
                    timeline.to(
                        ".items",
                        {
                            rotation: -rotationAngle,
                            duration: 1,
                            ease: "power1.out",
                        },
                        0.15 * (imageSize / 2 - 1) + 1
                    );
                }
            });

            // 드래그 가능한 기능 추가 함수를 호출합니다.
            draggable();
        };

        // 특정 카드가 중앙에 오도록 설정할 인덱스를 지정합니다.
        const selectedCardIndex = 0; // 예시로 3번 카드를 선택

        // 드래그 가능한 기능을 추가하는 함수를 선언합니다.
        const draggable = () => {
            // 드래그 시작 시점의 초기 값을 저장하는 변수를 선언합니다.
            let start = 0;
            Draggable.create(".items", {
                type: "rotation",

                // 드래그가 시작될 때의 동작을 정의합니다.
                onDragStart: function () {
                    start = this.rotation;
                },

                // 드래그가 끝날 때의 동작을 정의합니다.
                onDragEnd: function () {
                    // 드래그 종료 시점의 회전값을 저장합니다.
                    const rotation = this.rotation;
                    // 회전값의 변화량을 계산합니다.
                    const offset = Math.abs(rotation - start);
                    // 기존 각도의 절반을 계산합니다.
                    const halfDegree = degree / 2;

                    // 드래그 방향에 따라 애니메이션을 적용합니다.
                    if (rotation > start) {
                        if (offset < halfDegree) {
                            gsap.to(".items", {
                                rotation: "-=" + offset,
                            });
                        } else {
                            gsap.to(".items", {
                                rotation: "-=" + halfDegree,
                            });
                        }
                    } else {
                        if (offset < halfDegree) {
                            gsap.to(".items", {
                                rotation: "+=" + offset,
                            });
                        } else {
                            gsap.to(".items", {
                                rotation: "+=" + halfDegree,
                            });
                        }
                    }

                    // 드래그가 끝나면 회전 각도를 보정하여 중앙에 가까운 이미지를 중앙에 고정합니다.
                    const currentRotation = gsap.getProperty(".items", "rotation");
                    const correctedRotation = Math.round(currentRotation / degree) * degree;
                    gsap.to(".items", {
                        rotation: correctedRotation,
                        duration: 0.5,
                    });
                },
            });
        };

        // 초기화 함수를 호출합니다.
        init();
    </script>

</body>

</html>