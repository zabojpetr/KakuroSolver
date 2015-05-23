-- Kakuro bude zadáno ve čtvercové podobě, abych mohl dopočítat rozměry a nemusel je posílat v každé funkci
-- Obdelníkové hlavolamy lze snadno převést na čtvercové, přidáním řádků/sloupců s prázdnými buňkami
import Data.List

--------------------------------------------------------------------------------
--                                   PŘÍKLADY                                 --
--------------------------------------------------------------------------------Prelude> [1 of 1] Compiling Main             ( C:\Users\Public\Documents\Skola\Neprocko\Haskell\kakuro\kakuro.hs, interpreted )

vyresene::[KakuroCell]
vyresene = [(-2,0,0),(-2,0,0),(-1,0,15),(-1,0,4),(-2,0,0),(-2,0,0),(-2,0,0),(-1,6,0),(5,0,0),(1,0,0),(-1,0,29),(-1,0,15),(-2,0,0),(-1,21,14),(2,0,0),(3,0,0),(7,0,0),(9,0,0),(-1,9,0),(8,0,0),(1,0,0),(-1,14,17),(8,0,0),(6,0,0),(-1,30,0),(6,0,0),(7,0,0),(8,0,0),(9,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,14,0),(9,0,0),(5,0,0),(-2,0,0)]
nevyresene::[KakuroCell]
nevyresene = [(-2,0,0),(-2,0,0),(-1,0,15),(-1,0,4),(-2,0,0),(-2,0,0),(-2,0,0),(-1,6,0),(0,0,0),(0,0,0),(-1,0,29),(-1,0,15),(-2,0,0),(-1,21,14),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,9,0),(0,0,0),(0,0,0),(-1,14,17),(0,0,0),(0,0,0),(-1,30,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,14,0),(0,0,0),(0,0,0),(-2,0,0)]
dobre::[KakuroCell]
dobre = [(-2,0,0),(-1,0,4),(-1,0,4),(-1,4,0),(1,0,0),(3,0,0),(-1,4,0),(3,0,0),(1,0,0)]
spatne::[KakuroCell]
spatne = [(-2,0,0),(-1,0,4),(-1,0,4),(-1,4,0),(2,0,0),(2,0,0),(-1,4,0),(2,0,0),(2,0,0)]
easy::[KakuroCell]
easy = [(-2,0,0),(-1,0,3),(-1,0,4),(-1,3,0),(0,0,0),(0,0,0),(-1,4,0),(0,0,0),(0,0,0)]
easy2::[KakuroCell]
easy2 = [(-2,0,0),(-1,0,17),(-1,0,16),(-1,0,14),(-1,24,0),(0,0,0),(0,0,0),(0,0,0),(-1,23,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0)]
medium::[KakuroCell]
medium = [(-2,0,0),(-1,0,20),(-1,0,14),(-1,0,11),(-1,16,0),(3,0,0),(0,0,0),(0,0,0),(-1,18,0),(0,0,0),(0,0,0),(4,0,0),(-1,11,0),(0,0,0),(0,0,0),(0,0,0)]
extreme::[KakuroCell]
extreme = [(-2,0,0),(-1,0,7),(-1,0,11),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,4,0),(0,0,0),(0,0,0),(-1,0,22),(-1,0,7),(-1,0,17),(-2,0,0),(-2,0,0),(-1,0,4),(-1,0,12),(-1,28,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,10),(-1,11,26),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,33,10),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-1,6,0),(0,0,0),(0,0,0),(-2,0,0),(-1,4,0),(0,0,0),(0,0,0),(-1,0,11),(-2,0,0),(-2,0,0),(-1,9,0),(0,0,0),(0,0,0),(-1,0,12),(-2,0,0),(-1,7,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,0,14),(-1,11,7),(0,0,0),(0,0,0),(-1,0,9),(-1,13,4),(0,0,0),(0,0,0),(-2,0,0),(-1,35,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,11),(-1,0,17),(-1,14,0),(0,0,0),(0,0,0),(-2,0,0),(-1,20,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,16,0),(0,0,0),(0,0,0)]
extreme2::[KakuroCell]
extreme2 = [(-2,0,0),(-2,0,0),(-1,0,30),(-1,0,10),(-2,0,0),(-2,0,0),(-1,0,24),(-1,0,11),(-1,0,33),(-1,0,32),(-2,0,0),(-2,0,0),(-2,0,0),(-1,7,11),(0,0,0),(0,0,0),(-2,0,0),(-1,13,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,17,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,16),(-1,30,42),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,10,0),(0,0,0),(0,0,0),(-1,18,10),(0,0,0),(0,0,0),(0,0,0),(-1,12,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,24,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-1,11,11),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,20,33),(0,0,0),(0,0,0),(0,0,0),(-1,20,19),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,41,33),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,19,0),(0,0,0),(0,0,0),(0,0,0),(-1,21,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,29),(-1,0,7),(-2,0,0),(-2,0,0),(-1,7,0),(0,0,0),(0,0,0),(-2,0,0),(-1,15,13),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,8,0),(0,0,0),(0,0,0),(-1,15,16),(0,0,0),(0,0,0),(0,0,0),(-1,11,15),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,26,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-1,18,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,19,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-1,13,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0)]
extreme3::[KakuroCell]
extreme3 = [(-2,0,0),(-2,0,0),(-2,0,0),(-1,0,10),(-1,0,15),(-2,0,0),(-1,0,36),(-1,0,8),(-2,0,0),(-2,0,0),(-2,0,0),(-1,0,3),(-1,13,14),(0,0,0),(0,0,0),(-1,11,8),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,31,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,10,0),(0,0,0),(0,0,0),(-1,0,24),(-1,4,29),(0,0,0),(0,0,0),(-1,0,14),(-2,0,0),(-2,0,0),(-2,0,0),(-1,16,0),(0,0,0),(0,0,0),(0,0,0),(-1,9,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,15,0),(0,0,0),(0,0,0),(-1,16,0),(0,0,0),(0,0,0),(-1,0,10),(-2,0,0),(-2,0,0),(-2,0,0),(-1,10,0),(0,0,0),(0,0,0),(-1,19,16),(0,0,0),(0,0,0),(0,0,0),(-1,0,17),(-2,0,0),(-2,0,0),(-2,0,0),(-1,13,12),(0,0,0),(0,0,0),(-1,0,8),(-1,10,12),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,36,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,9,0),(0,0,0),(0,0,0),(-1,14,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0)]
extreme4::[KakuroCell]
extreme4 = [(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,0,6),(-1,0,23),(-2,0,0),(-2,0,0),(-1,0,7),(-1,0,23),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,0,18),(-1,0,12),(-2,0,0),(-1,0,12),(-1,0,26),(-1,9,0),(0,0,0),(0,0,0),(-2,0,0),(-1,13,19),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,7,23),(0,0,0),(0,0,0),(-1,3,0),(0,0,0),(0,0,0),(-1,5,16),(0,0,0),(0,0,0),(-1,18,10),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,7,0),(0,0,0),(0,0,0),(0,0,0),(-1,10,0),(0,0,0),(0,0,0),(0,0,0),(-1,21,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,20,15),(0,0,0),(0,0,0),(0,0,0),(-1,24,0),(0,0,0),(0,0,0),(0,0,0),(-1,11,20),(0,0,0),(0,0,0),(0,0,0),(-1,0,17),(-2,0,0),(-2,0,0),(-1,14,0),(0,0,0),(0,0,0),(-1,0,23),(-1,0,12),(-1,0,15),(-1,20,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,10,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,26,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,13),(-2,0,0),(-1,13,19),(0,0,0),(0,0,0),(-1,13,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,33,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,15,30),(0,0,0),(0,0,0),(-1,0,16),(-2,0,0),(-2,0,0),(-1,0,21),(-1,0,29),(-2,0,0),(-2,0,0),(-1,16,0),(0,0,0),(0,0,0),(-2,0,0),(-1,31,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,12),(-1,17,13),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,0,11),(-1,0,23),(-2,0,0),(-1,10,37),(0,0,0),(0,0,0),(-1,26,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,11),(-2,0,0),(-2,0,0),(-1,4,0),(0,0,0),(0,0,0),(-1,16,0),(0,0,0),(0,0,0),(-1,0,9),(-1,0,16),(-1,34,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,17,0),(0,0,0),(0,0,0),(-1,18,14),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,13),(-2,0,0),(-1,0,20),(-1,4,13),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,0,7),(-1,18,21),(0,0,0),(0,0,0),(0,0,0),(-1,21,0),(0,0,0),(0,0,0),(0,0,0),(-1,22,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,33,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,6,17),(0,0,0),(0,0,0),(0,0,0),(-1,9,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-1,8,0),(0,0,0),(0,0,0),(0,0,0),(-1,13,0),(0,0,0),(0,0,0),(-1,3,0),(0,0,0),(0,0,0),(-1,16,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,11,0),(0,0,0),(0,0,0),(-2,0,0),(-1,17,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0)]

infinity::[KakuroCell]
infinity = [(-2,0,0),(-2,0,0),(-1,0,45),(-1,0,42),(-2,0,0),(-1,0,7),(-1,0,45),(-1,0,35),(-1,0,15),(-1,0,30),(-1,0,24),(-2,0,0),(-1,0,31),(-1,0,9),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,16,7),(0,0,0),(0,0,0),(-1,39,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,3,35),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,19,0),(0,0,0),(0,0,0),(0,0,0),(-1,45,39),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,20,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,38,19),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,37,7),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,11,21),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,4),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,45,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,6,45),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,39,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,21,27),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,24,9),(0,0,0),(0,0,0),(0,0,0),(-1,37,36),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,24),(-1,0,38),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,16,0),(0,0,0),(0,0,0),(-1,32,22),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,25,36),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,8,0),(0,0,0),(0,0,0),(0,0,0),(-1,38,45),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,8,36),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,0,22),(-1,6,37),(0,0,0),(0,0,0),(0,0,0),(-1,41,4),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,31,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,16,17),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,32,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,37,30),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,21,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,40,38),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,42,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,10,45),(0,0,0),(0,0,0),(0,0,0),(-1,0,45),(-1,0,16),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,16,0),(0,0,0),(0,0,0),(-1,29,42),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,16,21),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,13,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,17,28),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,9,28),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,0,12),(-1,21,24),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,9,11),(0,0,0),(0,0,0),(0,0,0),(-1,0,12),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,25,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,24,15),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,19,0),(0,0,0),(0,0,0),(0,0,0),(-1,45,10),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,10,6),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,22,21),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,3),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,36,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,10,3),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,45,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,7,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-1,9,0),(0,0,0),(0,0,0),(-1,35,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,3,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0)]
infinity2::[KakuroCell]
infinity2 = [(-2,0,0),(-1,0,24),(-1,0,28),(-2,0,0),(-1,0,14),(-1,0,33),(-1,0,13),(-1,0,8),(-1,0,39),(-2,0,0),(-1,0,27),(-1,0,45),(-1,0,16),(-1,0,8),(-2,0,0),(-1,0,20),(-1,0,32),(-1,0,21),(-1,12,0),(0,0,0),(0,0,0),(-1,16,43),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,30,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,11,10),(0,0,0),(0,0,0),(0,0,0),(-1,43,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,36,6),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,32,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,22,19),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,11,11),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-1,33,13),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,42,45),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,12,40),(0,0,0),(0,0,0),(-1,15,0),(0,0,0),(0,0,0),(0,0,0),(-1,29,8),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,18,30),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,11,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,24,10),(0,0,0),(0,0,0),(0,0,0),(-1,18,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,22,12),(0,0,0),(0,0,0),(0,0,0),(-2,0,0),(-1,0,24),(-1,34,36),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,35),(-2,0,0),(-1,23,26),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,21),(-1,0,13),(-1,24,0),(0,0,0),(0,0,0),(0,0,0),(-1,19,26),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,6,6),(0,0,0),(0,0,0),(0,0,0),(-1,10,27),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,20,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,42,27),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,23,28),(0,0,0),(0,0,0),(0,0,0),(-1,12,0),(0,0,0),(0,0,0),(-1,33,7),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,33,7),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,0,22),(-1,27,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,23,12),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,24,12),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,37,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,36,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,7,0),(0,0,0),(0,0,0),(0,0,0),(-1,10,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,16,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(0,0,0),(-1,8,0),(0,0,0),(0,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0),(-2,0,0)]

--------------------------------------------------------------------------------
--                                    ŘEŠENÍ                                  --
--------------------------------------------------------------------------------

-- buňka v kakuro
type KakuroCell = (Int,Int,Int)
	--hodnota - -2 - 9 
		-- -2 - prázdná buňka, blok
		-- -1 - pomocná buňka, blok s horizontální nebo vertikální hodnotou
		-- 0 - nevyplněná buňka 
		-- 1-9 - koncový stav, vyplněná buňka
	--horizontální hodnota - 0 - 45
		-- 0 - pro buňky na doplňování a pro bloky, které neurčují horizontální součet
		-- 1 - 45 pro bloky určující horizontální součet
	--vertikální hodnota - 0 - 45
		-- 0 - pro buňky na doplňování a pro bloky, které neurčují vertikální součet
		-- 1 - 45 pro bloky určující vertikální součet





kakuro::[KakuroCell]->IO()
			--zkontroluje vyplněné kakuro
kakuro xs | solved xs && checkValidity xs = putStr $ unlines ["Spravne reseni"] ++ "\n"
		  | solved xs = putStr $ unlines ["Spatne reseni"] ++ "\n"
		  	--když kakuro není vyplněné, vyplní ho a napíše výsledek
		  | otherwise = if solved result && checkValidity result then putStr $ unlines ["Ma reseni"] ++ show result ++ "\n"
		  				else putStr $ unlines ["Nema reseni"] ++ show result ++ "\n"
		  					where
		  						result = solve xs

--rekurze iterací
solve::[KakuroCell]->[KakuroCell]
-- další iterace vyplnění je stejná jako předchozí a není úplně vyplněné, pak doplnit číslo náhodně a zkusit znovu vyřešit
				--další iterace je celé řešení -> vracím řešení
solve table | solved iteration = iteration
			  	--další iterace je stejná jako předchozí -> doplním náhodně jedno číslo
			  | iteration == table = calculationRandom table
			  	--další iterace pokročila, ale ještě není hotová -> počítám další iteraci
			  | otherwise = solve iteration
			  		where
			  			--iterace je přidání čísel pomocí průniků řešení
			  			iteration = calculationIntersect table

--příprava na iteraci, výpočet indexů buněk které nejsou vyplněny
calculationIntersect::[KakuroCell]->[KakuroCell]
calculationIntersect table = calculationIntersect' table (nonfieldCell table 0)

--Dostane kakuro a seznam míst, kde může něco doplnit
--Snaží se pomocí průniků řádků a sloupců doplnit čísla na pozice
calculationIntersect'::[KakuroCell]->[Int]->[KakuroCell]
calculationIntersect' table [] = table
calculationIntersect' table (p:ps) = calculationIntersect' newTable ps
										where
											(colCombinations,rowCombinations) = colRowCombinations table p
											--průnik kombinací ze sloupce a řákdu
											intersection = intersectOwn rowCombinations colCombinations
											--vytvoří novou tabulku, pokud bylo možné určit číslo
											newTable = if length intersection == 1 then changeValue table p ((intersection!!0),0,0)
													   else table

--najití vhodného čísla podle průsečíku
intersectOwn::[[Int]]->[[Int]]->[Int]
intersectOwn [] _ = []
intersectOwn _ [] = []
intersectOwn [x] [y] = intersect x y
intersectOwn (x:xs) ys = union (intersectOwn' x ys) (intersectOwn xs ys)

--všechny možné průsečíky -> jiný průsešík není možný
intersectOwn' x [] = []
intersectOwn' x (y:ys) = union (intersect x y) (intersectOwn' x ys)

--kombinace na pozici pro řádek a sloupec
colRowCombinations::[KakuroCell]->Int->([[Int]],[[Int]])
colRowCombinations table p = (colCombinations,rowCombinations)
									where
										--šířka/výška tabulky
										len = isqrt $ length table
										column = getColumn table (p `mod` len)
										--zjištění začátku a konce sekvence pro řádek (v rámci celé tabulky) a sloupec (v rámci sloupce)
										(colStart, colEnd) = boundary column (p `div` len)
										(rowStart, rowEnd) = boundary table p
										--sekvence na řádku, sloupci
										row = [x|ind<-[rowStart..rowEnd],x<-[table!!ind]]
										col = [x|ind<-[colStart..colEnd],x<-[column!!ind]]
										--již použitá čísla v sekvenci
										usedInCol = usedNumber col
										usedInRow = usedNumber row
										--použitelná čísla v řádku, sloupci
										freeInCol = [1,2,3,4,5,6,7,8,9] \\ usedInCol
										freeInRow = [1,2,3,4,5,6,7,8,9] \\ usedInRow
										--zbývající suma v řádku, sloupci 
										sumRow = getHorizontalValue (table!!(rowStart - 1)) - sum usedInRow
										sumCol = getVerticalValue (column!!(colStart - 1)) - sum usedInCol
										--Vygenereje možné kombinace pro zbytek sekvence a zbylou sumu
										colCombinations = combinations (colEnd - colStart + 1 - length usedInCol) sumCol freeInCol
										rowCombinations = combinations (rowEnd - rowStart + 1 - length usedInRow) sumRow freeInRow
											

--příprava na iteraci, výpočet indexů buněk které nejsou vyplněny
calculationRandom::[KakuroCell]->[KakuroCell]
calculationRandom table = calculationRandom' table position options
								where
									position = findBestPosition table (nonfieldCell table 0)
									--position = (nonfieldCell table 0)!!0
									(colCombinations,rowCombinations) = colRowCombinations table position
									options = intersectOwn colCombinations rowCombinations



--Dostane kakuro, místo, kde může něco doplnit a pole co může doplnit
--Přidá číslo z množné nabídky (z možných kombinací)
calculationRandom'::[KakuroCell]->Int->[Int]->[KakuroCell]
calculationRandom' table _ [] = table
calculationRandom' table p (op:ops) | solved newResult && checkValidity newResult = newResult
								  	  | otherwise = calculationRandom' table p ops
								  	  		where
								  	  			newTable = changeValue table p (op,0,0)
								  	  			newResult = solve newTable
								  	  			calculRandomResult = calculationRandom newResult

--najde buňku s minimálním množstvím kombinací a vrátí její pozici
--kakuro->nevyplněné buňky->pozice
findBestPosition::[KakuroCell]->[Int]->Int
findBestPosition table fs = findBestPosition' counts fs (minimum counts)
							where
								counts = countOfOptions table fs 

--[počty možností]->[pozice]->min->result position
findBestPosition'::[Int]->[Int]->Int->Int
--nemá koncovou podmínku prtoože nikdy nenastane
findBestPosition' (x:xs) (f:fs) m | x==m = f
						   		  | otherwise = findBestPosition' xs fs m

--vrátí pole s počtem možností
--kakuro->nevyplněné buňky->počty možností
countOfOptions::[KakuroCell]->[Int]->[Int]
countOfOptions _ [] = []
countOfOptions table (p:ps) = (length options):(countOfOptions table ps)
								where
									(colCombinations,rowCombinations) = colRowCombinations table p
									options = intersectOwn colCombinations rowCombinations

--vypíše již použitá čísla
usedNumber::[KakuroCell]->[Int]
usedNumber [] = []
usedNumber (x:xs) | (getValue x) > 0 = (getValue x):(usedNumber xs)
				  | otherwise = usedNumber xs

--Vrátí všechny kombinace délky l, které mají součet s a jsou tvořeny z čísel xs
combinations::Int->Int->[Int]->[[Int]]
combinations l s xs = filter((==) l.length) $ filter ((==) s . sum) $ subsequences xs

--vrátí hranice sekvence pro buňku (1.-poslední)
boundary::[KakuroCell]->Int->(Int,Int)
boundary table p = ((leftBoundary table p),(rightBoundary table p))
						where
							leftBoundary table p | p < 0 = 0
												   | getValue (table!!p) < 0 = p+1
												   | otherwise = leftBoundary table (p-1)
							rightBoundary table p | p >= (length table) = length table -1
													| getValue (table!!p) < 0 = p-1
												    | otherwise = rightBoundary table (p+1)

--vrátí indexy nevyplněných buněk
nonfieldCell::[KakuroCell]->Int->[Int]
nonfieldCell [] _ = []
nonfieldCell (x:xs) position | getValue x == 0 = position : (nonfieldCell xs (position + 1))
						  	 | otherwise = nonfieldCell xs (position + 1)

--isqrt - vrací celočíselnou hodnotu odmocniny
isqrt::Int -> Int
isqrt x = fromInteger $ floor $ sqrt  $ fromIntegral x

-- vrací hodnotu v kakuro cell
getValue::KakuroCell -> Int
getValue (x,_,_) = x

-- vrací hodnotu v kakuro cell
getHorizontalValue::KakuroCell -> Int
getHorizontalValue (_,x,_) = x

-- vrací hodnotu v kakuro cell
getVerticalValue::KakuroCell -> Int
getVerticalValue (_,_,x) = x

--kontrola jestli je kakuro vyřešeno
solved::[KakuroCell] -> Bool
solved table = (0,0,0) `notElem` table

--získání sloupce z kakura (!! od 0)
getColumn::[KakuroCell]->Int->[KakuroCell]
getColumn table col = [v | ind <- [col, col+width..l-1], v <- [table!!ind]]
							where 
								l = length table
								width = isqrt l


--změní hodnotu kakuroCell na pozici order (od 0) novou buňkou newCell
changeValue::[KakuroCell]->Int->KakuroCell->[KakuroCell]
changeValue table order newCell = leftKakuro ++ (newCell:rightKakuro)
										where
											leftKakuro = [v | ind <- [0..order-1], v <- [table!!ind]]
											rightKakuro = [v | ind <- [order+1..(length table)-1], v <- [table!!ind]]













--------------------------------------------------------------------------------
--                                   KONTROLA                                 --
--------------------------------------------------------------------------------

--rozdělí na dvojice (suma,[čísla]) a zkontroluje jestli sum[čísla] = suma, pro řádky a sloupce
checkValidity::[KakuroCell]->Bool
checkValidity table = (checkRows $ rowsToColumns table) && checkRows table

--zkontroluje řádky
checkRows::[KakuroCell]->Bool
checkRows table = checkPair $ cutToSumNumbers table

--rozseká tabulku na seznam (suma,[čísla])
cutToSumNumbers::[KakuroCell]->[(Int,[Int])]
cutToSumNumbers table = cutToSumNumbers' table (indexesOfHelperBlocks table 0)

cutToSumNumbers'::[KakuroCell]->[Int]->[(Int,[Int])]
cutToSumNumbers' table [] = []
cutToSumNumbers' table [i] = [(s,[v | ind <- [i+1..(length table)-1], v <- [getValue $ removeBlock $ table!!ind]])]
								where
									(_,s,_) = table!!i
cutToSumNumbers' table (i:j:ind) = (s,[v | inds <- [i+1..j-1], v <- [getValue $ removeBlock $ table!!inds]]):cutToSumNumbers' table (j:ind) 
										where
											(_,s,_) = table!!i

--odebere prázdné buňky
removeBlock::KakuroCell -> KakuroCell
removeBlock (x@(y,_,_)) | y == -2 = (0,0,0)
						| otherwise = x

--vrátí indexy pomocných buněk
indexesOfHelperBlocks::[KakuroCell]->Int->[Int]
indexesOfHelperBlocks [] _ = []
indexesOfHelperBlocks ((x,_,_):xs) ind | x < 0 = ind:indexesOfHelperBlocks xs (ind+1)
							     	   | otherwise = indexesOfHelperBlocks xs (ind+1)

-- zkontroluje jestli sum[čísla] = suma a jestli se v číslech nevyskytují stejná čísla
checkPair::[(Int,[Int])] -> Bool
checkPair [] = True
checkPair ((value,values):xs) | (value == sum values) && (notSameValues $ sort values) = checkPair xs
							  | otherwise = False

--Zkontroluje zda nejsou v jedné sekvenci stejné hodnoty
notSameValues::[Int]->Bool
notSameValues [] = True
notSameValues [x] = True
notSameValues (x:y:xs) | x == y = False
					   | otherwise = notSameValues (y:xs)

--převede řádkovou reprezentaci na sloupcovou a naopak (přehazuje i hozizonální a vertikální sumu)
rowsToColumns::[KakuroCell]->[KakuroCell]
rowsToColumns table = map (\x@(a,b,c) -> (a,c,b)) $ concat [v | ind <- [0..(isqrt $ length table)-1], v <- [getColumn table ind]]