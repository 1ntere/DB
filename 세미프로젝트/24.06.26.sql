DROP TABLE coffee;

CREATE TABLE coffee (
    coffee_id NUMBER PRIMARY KEY,
    coffee_name VARCHAR2(255) NOT NULL,
    coffee_description VARCHAR2(4000) NOT NULL,
    coffee_cuppingnote VARCHAR2(4000) NOT NULL,
    coffee_image_path VARCHAR2(4000) NOT NULL,
    coffee_sour NUMBER,
    coffee_bitter NUMBER,
    coffee_sweet NUMBER,
    coffee_body NUMBER,
    coffee_flavor NUMBER
);

CREATE SEQUENCE coffee_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

/*
원두 정보 넣기 템플릿
INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_SEQ1.NEXTVAL, '',
'',
'',
'');
*/

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '브라질 옐로우버번',
'옐로우라는 이름에 걸맞게 커피체리의 색이 노란색을 가진 것이 옐로우 버번입니다. 맛은 밝고 깔끔한 산미가 특징이며, 견과류의 향미가 입과 코에 매력적으로 다가오며 잘 익은 농후한 감귤류의 산미가 입안 가득 매꿔지는 게 특징입니다.',
'#은은한 감귤류의 산미 #견과류의 고소함 #비스킷의 향미',
'C:\Users\user1\Desktop\semi_1ntere\vscode\image\커피창고 원두사진');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '다크 블랜드',
'다크 블랜드는 커피 본연의 쓴맛이 진하게 느껴지지만 불쾌한 쓴맛이 아니라 다크초콜릿에서 느껴지는 쌉싸름함과 풍미가 좋은 커피입니다. 캬라멜의 단맛과 땅콩처럼 고소하면서 버터처럼 바디감이 좋은 커피입니다.',
'#다크초콜렛의 쌉싸름한 풍미 #땅콩의 부드럽고 고소한 맛 #카라멜의 단맛',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '코소롱 블랜드',
'코소롱은 고소하다의 제주도 방언으로 이름에 걸맞게 견과류, 비스킷의 고소한 맛, 향미가 특징이며 코코아의 은은한 풍미, 단맛이 큰 특징인 블랜드입니다.',
'#볶은 견과류의 향미 #비스킷처럼 고소한 맛 #코코아의 은은한 풍미',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '달보드레 블랜드',
'블랜드 달보드레는 순수 우리말로써 "달달하고 부드럽다" 라는 뜻을 지니고 있습니다. 은은한 군고구마의 향미에 흑설탕의 달달하고 감칠맛 나는 행복감을 주는 블랜드 커피입니다.',
'#군고구마의 은은한 향 #흑설탕의 달달한 맛 #카라멜의 달콤함',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '오롯이 블랜드',
'우리 고유 표현 중 오롯이는 모자람 없이 온전하게 라는 뜻입니다. 모자람도 치우침도 없이 오롯이 맛의 균형을 잡고 있는 웰 밸런스의 매력적인 블랜드입니다. 라떼와도 잘 어울리며 코끝에서 전해오는 모카, 바닐라 향과 균형 잡힌 플레이버와 중후한 바디감을 선사합니다.',
'#견과류의 고소한 맛 #쌉싸름한 카카오의 향미 #은은한 바닐라향',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '디카페인 블랜드',
'디카페인 블랜드는 브라질, 과테말라, 콜롬비아 산지의 배합으로 각각의 장점을 살려 디카페인 커피를 더욱 맛있게 즐기기 위한 블랜드입니다. 오렌지의 산미와 향미가 편안하고 은은하게 느껴지며 초콜렛 같은 부드러운 풍미, 브라운슈가의 부드러운 단맛이 특징인 블랜드입니다.',
'#초콜렛의 부드러운 풍미 #브라운슈가의 단맛 #오렌지의 은은한 산미',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '케냐 AA TOP 스페셜티',
'케냐 내에서 단일 농장으로는 최대 규모인 Muthaite Estate는 유기물이 풍부하고 짙은 붉은 화산 토양으로 커피 재배에 완벽한 환경을 제공합니다. 더불어 오랜 기간에 걸친 꼼꼼한 관리와 풍부한 경험은 고품질 커피를 생산해 내는 원동력이 되고 있습니다. 이렇게 생산된 케냐 AA TOP는 오렌지주스 같은 산뜻한 신맛 , 조청의 달콤한 풍미와 레드와인 같은 여운이 이어지는 매력적인 커피입니다.',
'#오렌지 주스 같은 산미 #조청의 달콤한 풍미 #레드와인의 여운',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '에티오피아 아리차 내추럴 G1 스페셜티',
'아리차는 예가체프의 게데오 지역에 위치한 작은 마을의 이름 입니다. 고지대(1,800m~2,100m) 지역에서 커피를 재배하기 때문에 생두의 밀도가 높고 당도와 신맛이 우수 합니다. 미네랄이 풍부한 토질로 인하여 딸기 같은 매력적인 향미와 블루베리 처럼 상큼한 산미를 지니고 있으며, 싱그러운 꽃향기가 특징 입니다.',
'#블루베리의 상큼한 산미 #딸기의 달콤한 향미와 단맛 #밀크초콜렛의 부드러운 여운',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '에티오피아 모모라 워시드 G1 스페셜티',
'에티오피아 모모라 워시드는 우라가 구지 지역에 단세 모모라 농장에 재배하는 커피입니다. 고지대(2,200m~2,250m) 지역에서 커피를 재배하기 때문에 생두의 밀도가 높고 당도와 신맛이 우수 합니다. 미네랄이 풍부한 토질로 인하여 꽃 향기의 매력적인 향미와 청포도 오렌지와 같은 상큼한 산미를 지니고 있으며, 홍차처럼 긴 여운이 특징 입니다.',
'#은은한 꽃향기 #오렌지 같은 산미 #청포도의 풍미 #홍차의 여운',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '에티오피아 코케허니 G1 스페셜티',
'꿀과 같은 단맛과 잘 익은 과일의 산미, 당도 높은 체리, 꿀과 같은 단맛이 좋으며 딸기, 블루베리에서 느낄 수 있는 베리류의 산미가 특징. 목 넘김이 부드럽고 마신 후에는 바닐라와 같은 달콤한 맛이 입안에 오래 남습니다. 에티오피아 고산지대와 기후에서 오는 과일의 산미와 허니 프로세싱의 가공 방식의 장점인 단맛이 잘 어우러져 커피가 가진 단맛, 신맛, 쓴맛의 밸런스가 좋습니다. 한마디로 표현하자면 과육이 많은 달콤한 과일의 맛과 잘 익은 딸기를 먹는 것 같은 느낌!',
'#블랙체리의 상큼함 #깊은 베리 향 #꿀 같은 단맛',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '과테말라 와이칸 스페셜티',
'와이칸은 우에우에테낭고 지역의 마야 방언으로 밤하늘의 빛나는 별을 뜻합니다.',
'#베리의 은은한 산미 #달콤한 바닐라와 슈가 브라운의 향미 #초콜릿처럼 부드럽고 촉촉한 질감',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '에티오피아 예가체프 G2',
'에티오피아 예가체프는 "커피의 귀부인" 이라는 칭호로 에티오피아에서 유명한 커피입니다. 다른 커피 생산국들보다 과실향이 풍부하고, 레몬이나 감귤류의 시트러스 한 산미를 가지고 있으며, 은은한 자스민과 같은 꽃 향을 가지고 있습니다.',
'#은은한 꽃향기 #레몬의 산미 #풍부한 과실향',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '에티오피아 시다모 G2',
'에티오피아 시다모는 깊고 묵직한 향미와 산미를 갖고 있어 "커피의 공작" 으로도 불립니다. 시다모는 레몬의 산미와 코코아의 풍미로 부드러운 느낌의 연출과 은은하게 퍼지는 레드와인류의 단맛, 씁쓸함을 함께 느끼 실 수 있습니다. 또, 상대적으로 낮은 카페인을 갖고 있어 저녁에 마시기에도 부담이 없는 커피입니다.',
'#은은하게 퍼지는 레드와인 #레몬의 산미 #코코아의 풍미',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '콜롬비아 수프리모',
'최고의 콜롬비아 커피는 생두 스크린 사이즈가 크고, 부드러운 맛과 향으로 유명해 아침을 시작하는 커피로 적합한 마일드 커피의 대명사이기도 합니다. 지속적으로 올라오는 단맛과 체리와 부드러운 초콜릿의 향, 과일류의 산미가 밸런스를 이루고 있습니다. 적당한 바디감과 과하지 않는 쓴맛이 커피의 풍미를 유지시켜 주며 커피가 식었을 때에도 맛의 변화가 적으며 여운이 긴 것이 특징으로 콜롬비아 수프리모 특유의 향을 오래 느낄 수 있습니다.',
'#은은한 적포도의 산미 #부드러운 초콜렛 향 #달콤한 시럽의 여운',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '과테말라 안티구아',
'과테말라 커피는 커피 원두 종류 중에서도 중후한 바디감을 느낄 수 있고, 다크초코의 쌉싸름함과 진한 스모키향과 뛰어난 풍미, 블랙커런트의 감칠맛과 부드러운 단맛이 특징입니다. 중후한 무게의 바디감으로 고급 스트레이트 커피나 블랜드 커피 모두에 사용되고 있습니다.',
'#블랙커런트 특유의 향미 #브라운슈가의 풍미 #다크초코의 씁쓸함',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '코스타리카 따라주 SHB',
'입안을 가득 메꾸는 듯한 사탕수수의 단맛과 고소한 견과류의 향미가 특징입니다. 열대과일의 산미를 느낄 수 있고, 깔끔한 애프터와 가볍지 않은 바디감을 가지고 있어 스트레이트 커피로도 훌륭한 커피입니다.',
'#열대과일의 산미 #사탕수수의 단맛 #카카오의 씁쓸함',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '탄자니아 AA',
'탄자니아는 에티오피아, 케냐와 함께 아프리카를 대표하는 3대 커피산지 중 하나입니다. 킬리만자로에서 생산되는 탄자니아 커피는 신사의 나라 영국 왕실의 손꼽는 커피로 아프리카 커피답게 좋은 산미와 매력적인 향미의 커피입니다.',
'#자몽 특유의 신맛 #다크초콜렛 특유의 풍미 #카라멜의 단맛과 여운',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '인도네시아 만델링 G1',
'인도네시아 만델링은 유럽에서 인기가 좋습니다. 중남미 커피에 비해 부드러우면서 바디감이 강한 농도를 가지고 있으며, 수마트라 섬의 특별한 토양으로 인하여 거친 흙 내음과 스파이시한 향이 있으며 고소하고 달콤한 맛이 특징입니다. 개성 있는 커피 맛을 원하는 사람에게 맞는 커피로 뒷맛의 여운이 오래도록 남는답니다. 묵직한 농도와 초콜릿 같은 풍미로 세계에서 가장 풍부한 농도의 아라비카 라는 평을 받기도 했습니다.',
'#오크 특유의 향미 #너트류의 고소함 #밀크초콜릿의 바디와 부드러움',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '인도 마이소르 너깃 엑스트라 볼드',
'인도 마이소르는 달콤하고 부드러운 오렌지류의 산미와 밀크초콜릿의 바디감, 견과류 특유의 향과 고소함으로 인도에서 생산되는 최상급 커피로써 싱글 오리진과 블랜드로 마셨을 때 각 매력을 느낄 수 있는 커피입니다.',
'#견과류 특유의 향과 고소함 #밀크초콜릿의 바디감 #스카치캔디의 은은한 신맛과 단맛',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '인도 몬순 말라바르 AA',
'인도 몬순은 인도의 서부 해안창고에 생두를 보관하여 아라비의 해의 몬순(남서 계절풍)바람을 12~16주 정도 맞게하면서 건조하여 숙성 하게 됩니다. 이러한 과정 끝에 맛은 산미가 거의 없는 것이 특징이며, 쓴맛과 구수한 여운이 강한 바디감을 만들어 내는데, 특히 향신료 같은 특유의 향과 보리의 구수함과 향, 달콤한 카라멜 시럽같은 단맛이 매력입니다.',
'#보리 구수한 향 #달콤한 카라멜 시럽의 단맛 #볶은견과류의 씁슬함',
'');

INSERT INTO coffee (coffee_id, coffee_name, coffee_description, coffee_cuppingnote, coffee_image_path) 
VALUES (coffee_seq.NEXTVAL, '브라질 세하도 파인컵 NY2',
'전 세계 커피 생산량 1위 브라질. 고소한 너트 향기, 캬라멜의 단맛, 산뜻한 산미가 적당한 균형을 이루며 그 산미 역시도 자연스럽고 가벼운 것이 특징입니다. 적절한 바디감에 로스팅 강도에 따라 다양한 맛이 표현되는데 마일드 커피의 대명사 콜롬비아 수프리모에 버금가는 커피입니다. 배전 포인트에 따라서 신맛, 단맛, 쓴맛의 밸런스가 있는 싱글 커피의 우수함을 보여주기도 하고 때로는 개성이 넘치지 않아 다른 원두와의 조화가 좋아서 블렌딩 베이스로 충분한 역할을 해주는 원두입니다.',
'#견과류 향미 #건포도의 산미 #캬라멜의 풍미',
'');

/*
아래에서 UPDATE를 통해
신맛 쓴맛 단맛 바디 향미를 UPDATE
*/

SELECT coffee_id, coffee_name, coffee_cuppingnote FROM coffee;
rollback;
commit;