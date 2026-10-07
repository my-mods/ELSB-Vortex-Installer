# ELSB — Character Body Customization Toolkit (v0.12 までの名前は Goldwalker) - 主人公とロマンス相手の見た目を選ぶ道具 + MOD 管理
#   Start_ELSB.bat から起動する。選んだ項目の箱 (modules\ の中の _P.pak/.ucas/.utoc) を ~mods に置き、選ばなかった物は外す。
#   箱の名前は Goldwalker…_P のまま (名前の順で読み込みの勝ち負けが決まるので変えない)。設定は ELSB.ini (前の Goldwalker.ini を引き継ぐ)
#   ELSB.dev があるフォルダは検証用 (窓に DEV、「操作キャラ (検証用)」が出る)。リリース版は make_release.py で作る (検証用の項目と本人の設定を入れない)
#   「MOD 管理」タブ: ~mods の中の MOD を全部並べ、チェックで有効・無効 (無効は Paks の外の Dawnwalker\Content\ELSB_DisabledMods へ移す。消さない)。
#     zip / rar / 7z / フォルダ / .pak をドラッグすると modules\external\<名前>\ に取り込む。箱の中身 (ファイル名) から「選ぶ項目」を 1 つ決め、
#     その項目のドロップダウンに「[MOD] 名前」として並ぶ (本人が変えられる。項目に当たらない MOD はチェックで有効・無効だけ)
#   コマンドライン (画面なし): -Apply -GameRoot <ゲームの一番上> [-Body <名前 | ext:MOD名>] [-Hair ...] ... [-Ext <名前,名前>]   /   -RemoveAll -GameRoot <...>
#                             -ModList / -ModOn <名前> / -ModOff <名前> -GameRoot <...>   /   -Rename <今の名前>,<新しい名前>   /   -Inspect <箱の .utoc | ext>
#                             -List   /   -Import <zip|フォルダ|箱> ...   /   -Shot <png> [-ShotTab 0-4] [-ShotItem <項目>] [-ShotMod <MOD>] [-ShotLang ja|en] [-ShotSize 1280x800]
#   v0.13 (2026-09-29): 名前を ELSB — Character Body Customization Toolkit に (本人「ELSB と分かるように」「あとは使いやすいと思う形で」)。画面を作り直した:
#     見出しに名前、項目を「体・頭・場面」にまとめる、右に大きい見本と選択肢の画像の一覧 (押して選ぶ・乗せると見本が替わる)、ドロップダウンにも小さい画像・色の見本、
#     適用前との違いに「変更」の印と件数・「元に戻す」、文字を大きく・名前とドロップダウンの幅は一番長い文字に合わせる (見切れないように)。
#     「他の MOD」タブを「MOD 管理」に (~mods の全部の MOD・有効/無効・置き換えるファイルとぶつかる相手・勝ち負け)。取り込んだ MOD は選ぶ項目 1 つに
#     (重なる項目全部に出ていた。重なる項目は「MOD が置き換え中」で選べなくする)。項目に当たらない MOD も取り込める。検証用とリリース用を分けた
#   v0.14 (2026-09-29): 品質 (本人「軽く動く・バグを潰す・ゲームの起動を遅くしていないか」)。MOD の有効/無効で移す先の同じ名前を上書きしない、
#     適用の途中で失敗したら知らせて画面を実際の状態に戻す (置く箱が modules に無ければ何も変えずに止める)、消す前・全部外す前の確認、
#     同じ名前の取り込みは置き換えるか別の名前かを聞く、最小の窓を画面に合わせる、-GameRoot が違うとき本物のゲームに切り替えない、
#     起動を軽く (modules の箱の一覧・取り込んだ MOD の判定を控える、並べ直しは最後に 1 回、画像の一覧は見えるタブだけ、大きい見本は最近の 6 枚だけ)、
#     自作の箱の多い MOD (BoDQS・DawnwalkerStealth) は MOD 管理で 1 行に。modules の箱の圧縮 (03_スクリプト/ELSB/compress_modules.py) の前の形の箱も
#     同じ選択肢と分かるように対応表 modules\_equiv.txt を読む
#   v0.14.1 (2026-09-29): 体型の選択肢の名前を全部「ELSB」に (本人「このMOD特有の体型の名前は全部ELSBに」。フォルダ名 masculine・fitness・booty はそのまま)。
#     アンカの体型の「入れ墨あり」を外した (ゲームは場面ごとに紋様・傷のある肌とない肌を切り替え、ELSB の体にもそのまま乗る。
#     「入れ墨あり」は完治した肌の画像に紋様と背中の傷を描き足していて、紋様が消える場面でも残った。控えは 06_退避ファイル/ELSB_anca_body_booty_tattoo_*)
#   v0.14.2 (2026-09-29): 取り込んだ MOD の書庫の中の画像を、その選択肢の見本にする (本人「MOD の zip に画像があれば見本に」)。
#     MOD 作者向けの決まり: 書庫に elsb_preview.png (か .jpg) = 見本、elsb_item.txt = 並べる項目 (KINDS の key か none)。
#     決まりの無い書庫は、画像が 1 枚だけか、名前に preview / thumbnail / thumb / cover を含む画像が 1 枚だけのときに使う (決められなければ使わない)。
#     長い辺が 1600 画素より大きい画像は縮める。本人が付けた見本 (画像のドラッグ・-SetPreview) は、同じ MOD を取り込み直しても替えない
#   v0.14.3 (2026-09-29): Nexus の見た目の MOD と手元の MOD (資料用MOD、目次のファイル名だけ) に合わせた (本人「必要なら対応 MOD の拡張を」):
#     「体の場面」に並んだ取り込んだ MOD が、体型が ELSB でないと置かれなかった不具合を直した (needs は ELSB の選択肢のための物)。
#     その人専用の服の網目・布を替える MOD (Revealing Anca / Lacra) を「体の場面」でなく「服」に並べる。
#     MOD の名前の手がかり ($NAME_HINTS: beard・hair・color・eye・outfit など) で、重なる項目の中から選ぶ。
#     見本の画像に .webp (Nexus の画像) を使える (Windows の WebP 画像拡張機能で PNG に)
#   v0.14.4 (2026-09-29): コーエンの髪型から 町人の髪 B/D/H (CitTorsoG、網目に後頭部が無く、本人がゲーム内でも欠けるのを確かめた) と
#     村人の髪 A を外した (本人の指示。modules\hair の 4 つは 06_退避ファイル/ELSB_hair_removed_0929_2304 へ)。
#     選んでいた人は、次の「適用」で置いてある髪の箱が外れる (髪型を選び直す)
#   v0.14.5 (2026-09-30): 文言 (本人): 体の場面の「全部の場面 (服の MOD と使う)」→「全部の場面」(服はもう体に合わせてある)、
#     服の「裸 (ELSB…)」→「裸」。「裸」は元から、その人の裸の場面の BDP (体型の箱が書き換える) を読むので、体型の選択どおりの体になる。説明文にもそう書いた
#   v0.14.6 (2026-10-01): ラクラの服を確定した体 (W5c) に合わせ直した (本家、本人了承)。「全部の場面」の見た目の設定は、ラクラに合わせた肌着の写し
#     (LacraX_Villager_Torso_X / Legs_X / TorsoLegs_Combined_X、服の表に行を足した) を指す。操作キャラ (検証用) のラクラ A・E も
#     ラクラの「体の場面」に合わせる (pairBy 'lacra_' = 'lacra_scope'。all = 合わせた肌着を指す写し、それ以外は今までの _vanilla)
#   v0.14.7 (2026-10-01): 見分けの付かない重複を外した (本人の指示)。髭の「村人の髭 A」(アンドレイの髭と網目・材質が同じ) と「ネベルの髭 A1」
#     (ネベルの髭 A と同じ物) をコーエンとマラトから、「村の女性の髪 H」(ヤナの髪と同じ髪型) をアンカとラクラから。マラトの髭の色の組も
#     (箱は 06_退避ファイル/ELSB_duplicates_removed_1001)。選んでいた人は、次の「適用」で置いてある箱が外れる (選び直す)
#   v1.0 (2026-10-01): リリース版 (本人「v1.0 で、とりあえず二言語でリリース」)。見た目をロゴに合わせた: 色はローズ、上にロゴの帯 (assets の画像、
#     無くても動く)、窓のアイコンはハート、白い枠の標準のタブをやめて自前の見出し (選んだタブにローズの下線)
#   v1.0.1 (2026-10-01): 報告の直し + 箱の名前。コーエンの紋様の網目 (ウィッチクラフトを全部取ると肩・上腕に出る) が古い体用の版のまま勝っていたのを直した
#     (body/masculine の GoldwalkerBody0Uw_P を外した、上腕の段)。コーエンの髭を BDP の髭の枠へ (ムービーで顔に合わない、分家)。
#     箱の名前を Goldwalker…_P から ELSB_…_P に (本人)。v1.0 の人の ~mods の前の名前の箱は、ELSB の箱として見分け、適用で外して置き直す
#   v1.1 (2026-10-02、10-01〜): 互換。他の作者の衣装 MOD (作者の許可を得た物) を ELSB の体に合わせた箱を modules\compat\<id>\ に置く (manifest.json)。
#     取り込んだ MOD の .ucas/.utoc の SHA256 が合い、その MOD を置き、requires (体型・範囲) を満たすときだけ 0ELSB_Compat*_P を置く (名前で相手と範囲の箱に勝つ)。
#     互換が使えるときは、その MOD が重なる「範囲」を置き換え中にせず選べるまま (服で選ぶと自動で全部の場面)。MOD 管理の詳細に互換の行
#     manifest の playas (10-01、分家の相談): 操作キャラ (検証用) がその選択肢のときだけ置く 2 つめの箱 (操作キャラの箱の写しで肌着を外した物など)。
#     base_sha256 が今の操作キャラの箱と違えば古い写しなので置かない。試験は tests/compat_real_test.py --playas=anca_A
#     10-02 (本家、Thicc Lacra): manifest の extra = 主の箱と一緒にいつも置く箱 (UnrealPak で焼いた画像の箱など。UcasPack は画像の大きなデータを詰められない)。
#     keeps = 互換が使えるとき、相手の MOD が重なっても ELSB の選択のまま置く項目 (体型・髪・マラトの範囲など。frees と違い requires の判定は省かない)。
#     操作キャラの写しの base_sha256 は、範囲で分かれる操作キャラ (lacra_A/all など) の箱とも比べる
#     dt = 服の表の写し (Thicc Lacra の上着の行の体を隠す設定を 0、実機で胴が消えた直し)。ELSB の表は髪の選択肢ごとに違うので、元の箱ごとの写しを持ち、
#     置く ELSB の箱のうち表が勝つ物 (名前が一番小さい) の場所と SHA256 に合う写しを置く。合わなければ互換を置かず「作り直しが必要」と出す
#     10-02 夜 (本家、本人「見切れて文字が読めない、ユーザーフレンドリーに」「互換は分かりやすい表記を」): MOD 管理を、幅いっぱいの 1 件 2 行の一覧
#     (名前は折り返す・横のスクロールなし) と下の 2 列の詳しい欄 (右に置き換えるファイル) に。互換のある MOD に表記 (ELSB 適用済 / ELSB 対応・未適用 /
#     ELSB 対応・使えない / ELSB 対応)、項目の「[MOD] 名前」に「(ELSB 対応)」。互換を使うときの ELSB の箱への負けは「意図どおり」(赤い負けに数えない)
#     10-02 夜 (本家、本人「全て採用」): MOD 管理のチェック = 項目のある取り込んだ MOD は「その項目の選択肢に出す」(出さない MOD は ini の ext_hidden)。
#     「勝つ・負ける」→「〜と N ファイルが重なる → どちらが使われる」、一覧のマーク (併用 OK / 一部が使われない / 使われない)、MOD 管理の字を 1 段大きく、
#     取り込みの見本は elsb_preview か画像 1 枚だけ、肌の項目の MOD は大文字・小文字の並べ方のどちらでも ELSB_ より先でなければ 0ELSB_Skin_
#     10-02 夜 (本家、本人「技術的すぎる」「選ばなくても ELSB と併用 OK か分かるように」): 一覧の印 = ELSB との関係 (併用 OK / 一部を置き換える /
#     一部とぶつかる。選んでいなくても出す) + 今の困りごと。詳しい欄は「ELSB との関係」「ほかの MOD との関係」。最初の窓 1700x1340、言語を替えても選択を残す
#   v1.1.1 (2026-10-02 夜、本人「懸念点は全て払拭したい」): 新しいフォルダの道具 (取り込みなし) で、前の道具の置いた MOD が「~mods の MOD」に見え、適用すると
#     体に合わせた版が外れていた → ~mods の ELSB 対応の MOD を見分ける (ELSB 対応 (取り込むと使えます))・「取り込む」ボタン (~mods の箱から)・
#     ~mods の MOD の説明 (外し方・取り込み方)・取り込まれていない MOD の体に合わせた版が外れる適用の前に確認。~mods から取り込んだ MOD は一覧から消しても ~mods に残す
#   v0.12 (2026-09-29): コーエンの「下着 (普段の場面)」を戻した (本人「他の MOD のデータは使わない、裸は自前で選べるように」)。中身は v0.8 と同じ
#     (ロマンスシーン以外の APP 18 個の下着の行を空に。ゲームのデータだけ。操作キャラを選ぶと置かない)。-CoenUw off
#     マラトの「服」に「裸 (下着なし)」を戻した (v0.8 と同じ中身: 普段の見た目 A〜D の場所に、下着を脱いだ裸の見た目の写し)。-MaratOutfit nude
#     9/27 に効かなかったのは、操作キャラのマラト (バニラの見た目の写し) で見ていたためと見られる → 操作キャラのマラト A・C・D は
#     マラトの「服」の選択に合わせる (選択肢のフォルダの中の <服の選択肢 | _vanilla> から置く。pairBy)
#   v0.11 (2026-09-29): 髪の色・髭の色 (11 色、-HairColor / -BeardColor / -AncaHairColor / -LacraHairColor / -MaratHairColor / -MaratBeardColor)。
#     色の箱 Goldwalker0Color…_P は、その人の髪 (元の髪と髪型の選択肢の写し) と眉の材質をその色にした物で、髪型の箱より先に読まれて勝つ。眉は髪より少し暗く連動
#     マラトの髭の色は、選んだ髭ごとの箱 (marat_beard_color\<色>\<髭 | _vanilla>) から置く (pair = 'marat_beard')。コーエンの髭は材質の写し (…_CoenBeard) にした
#     髪型・髭の位置を頭の形に合わせた (hair_headfit.py)
#   v0.10 (2026-09-29): マラトのタブに髪型と髭 (-MaratHair / -MaratBeard)。マラトの髪の 3 つのパス (普段・シャツ・上半身裸) と髭のパスを写しで上書きし、色はマラトの色。
#     髭は「なし」あり (髭の点を頭の中に畳む)。コーエンの髭「マラトの髭」は独立した写し (…_CoenX) にした (マラトの髭を替えてもコーエンは変わらない)
#   v0.9.1 (2026-09-27): 起動・適用を速くした (本人「起動まで遅い・適応に時間がかかる」)。同じ物が置かれている箱は写し直さない、
#     箱の目印 (SHA256) は名前・大きさ・更新日時が同じなら覚えた値を使う (Goldwalker.hashes)。服の箱は Oodle で圧縮 (1.2 GB → 約 0.6 GB)。
#     コーエンの服の当たり判定 3 つが壊れていてゲームが落ちたのを直した (中心 0 の要素に書き込んで別のデータを壊していた)
#   v0.9 (2026-09-27): 筋肉質 (Masculine) にコーエンの装備を合わせた箱 (GoldwalkerBodyGarm_P = 布の上着と当たり判定、GoldwalkerBodyGarmSK_P = ズボン・靴・籠手など)。
#     NPC と共有の服はコーエン専用の写し (CoenX) にし、服の表に行を足して向ける (元の行は NPC 用に残し、装備の結び付きだけ外す)。
#     共通の箱 (modules\_core\GoldwalkerZCore*_P: 服の表 + 共有の服のバニラの写し) を、何か置くときはいつも置く。服の表を持つ箱 (髪型・マラト) にも同じ行を入れた
#   v0.8.2 (2026-09-27): コーエンの体型「筋肉質 (第14版)」を外した (本人「古い方は分からなくなるので削除」)。「筋肉質・新 (Masculine)」は「筋肉質 (Masculine)」に改名
#   v0.8.1 (2026-09-27): マラトの「裸」とコーエンの「下着 (普段の場面)」を外した (マラトは実機で裸にならなかった。二人の裸は他の MOD を取り込んで選ぶ)。
#     前の版で置いた GoldwalkerUnderwear_P は ~mods から外す ($LEGACY)。アンカ・ラクラの「裸」はそのまま
#   v0.8 (2026-09-27): ロマンス相手の「服」に Goldwalker の「裸」(他の MOD なしで、その人のほかの見た目 APP の場所に裸の APP の写しを置く。
#     アンカ = 傷の場面は傷ありの裸、ほかは傷なし / ラクラ = 首の血の無い頭 / マラト = 下着あり・下着なし)。コーエンのタブに「下着 (普段の場面)」
#     (なし = ロマンスシーン以外の APP 18 個の下着の行を空に。操作キャラを選ぶと置かない)。-CoenUw off、-AncaOutfit nude 等
#   v0.7.1 (2026-09-27): 選択肢のフォルダの _default (先頭の選択肢のときも needs を満たせば置く箱)。マラトの「新しい体を入れる場面」に下着の写し (GoldwalkerMaratScopeUw_P:
#     服の表に行を足し、裸の見た目の下着をマラトの体に合わせた写しへ。名前が「脱ぐ」の箱より後なので「脱ぐ」はそのまま効く)
#   v0.7 (2026-09-26): コーエンのタブに「操作キャラ (検証用)」(コーエンの APP 20 個の場所にアンカ・ラクラ・マラトの APP の写しを置く。
#       その人の BDP と服の行を通るので Goldwalker の体型・服・髪型・目が出る。選ぶとロマンスシーンの箱は置かない)。-PlayAs <anca_A 等>
#       アンカ・ラクラの髪型 (他の女性の髪型を、その人の髪の色で。その人の髪のパスを上書き)、ラクラの目の光 (吸血鬼の目の光の色)。
#       服の合わせの箱を「全部の場面」に同梱 (アンカのコート・ズボン・靴・籠手、ラクラの上着 A/B・脚・靴、マラトの服)。-AncaHair / -LacraHair / -LacraEyes
#   v0.6.1 (2026-09-26): アンカの体型に「入れ墨あり」(傷なしの肌にゲームの赤い入れ墨 = 腕の模様と背中の文字を描き足した画像。形は入れ墨なしと同じ)。ラクラの腕 (三角筋と二の腕) を作り直した
#   v0.6 (2026-09-26): タブを人物ごとに (コーエン / アンカ / ラクラ / マラト / 他の MOD)。ロマンス相手ごとに「新しい体を入れる場面」(裸の場面だけ / 全部の場面) と
#       「服」(服を外す・替える MOD を取り込むと出る項目) を足した。-AncaScope / -LacraScope / -MaratScope all、-AncaOutfit / -LacraOutfit / -MaratOutfit ext:<名前>
#       「全部の場面」の箱は服を着た場面の BDP を新しい体に向け直す物で、体型が Goldwalker の新しい体型のときだけ置く (体型がバニラ・他の MOD なら置かない)
#   v0.5 (2026-09-25): 「ロマンス相手」タブ (アンカ・ラクラ・マラトの体型、マラトのロマンスシーン)。コーエンの体型に「筋肉質・新」。
#       1 つの選択肢に箱を複数入れられる (体の網目と肌 + 裸の設定 BDP の向け直し)。箱の名前は <種類の名前>*_P (例 GoldwalkerAncaBody_P と GoldwalkerAncaBodyBDP_P)
#       -AncaBody / -LacraBody / -MaratBody / -MaratRomance
#   v0.4.1 (2026-09-24): 見本の画像 (png / jpg) を右の見本にドラッグすると、今選んでいる項目の見本に差し替わる (ゲーム内のスクショを見本にする用)。-SetPreview <種類>,<選択肢>,<画像>
#   v0.4 (2026-09-24): 取り込んだ MOD を該当する項目のドロップダウンに出す (体型 MOD は体型の選択肢に加わる)。該当しない箱は取り込まない。取り込んだ MOD の名前を変えられる。
#       髪型・髭の見本を実物のテクスチャ (肌・髪のアルファ) と実機の位置で描き直した。髪型は 17 種 (イスブランド B は書き出せず、マラト A は B と同じメッシュなので外した)
#   v0.3.1 (2026-09-24): 他の MOD の .rar / .7z も取り込める (PC にある 7-Zip / WinRAR / NVIDIA App の 7z.exe を使う。無ければその旨を表示)。他の MOD の一覧を広げ、「競合」の印が切れないようにした
#   v0.3 (2026-09-24): 窓の大きさを変えられる (端をドラッグ、最大化。大きさは覚える)、真ん中に出す処理を Bloodywalker と同じ順 (表示前に位置を決め、表示後に最小化を解く) に
#   v0.2 (2026-09-24): タブ (コーエン / 他の MOD)、選択肢の見本画像、他の MOD のドラッグ取り込みと競合の印、ゲーム起動中と ~mods の中に置かれたときの警告
#   v0.1.1: 起動時の CenterToScreen の例外を直した。v0.1: 日本語 / 英語
param(
    [switch]$Plan,
    [string]$SelectionFile = '',
    [switch]$LibraryOnly,
    [switch]$Apply,
    [switch]$RemoveAll,
    [switch]$List,
    [string]$GameRoot = '',
    [string]$Body = '',
    [string]$Hair = '',
    [string]$Beard = '',
    [string]$Eyes = '',
    [string]$Romance = '',
    [string]$CoenUw = '',
    [string]$AncaBody = '',
    [string]$LacraBody = '',
    [string]$MaratBody = '',
    [string]$MaratRomance = '',
    [string]$AncaHair = '',
    [string]$LacraHair = '',
    [string]$LacraEyes = '',
    [string]$PlayAs = '',
    [string]$AncaScope = '',
    [string]$LacraScope = '',
    [string]$MaratScope = '',
    [string]$AncaOutfit = '',
    [string]$LacraOutfit = '',
    [string]$MaratOutfit = '',
    [string]$MaratHair = '',
    [string]$MaratBeard = '',
    [string]$HairColor = '',
    [string]$BeardColor = '',
    [string]$AncaHairColor = '',
    [string]$LacraHairColor = '',
    [string]$MaratHairColor = '',
    [string]$MaratBeardColor = '',
    [string]$Genitals = '',
    [string]$MaratGenitals = '',
    [string]$Skin = '',          # v1.1 (10-02 分家): 肌・メイク・タトゥ (コーエン / アンカ / ラクラ / マラト)
    [string]$AncaSkin = '',
    [string]$LacraSkin = '',
    [string]$MaratSkin = '',
    [string]$Ext = '',
    [string[]]$Import = @(),     # 他の MOD の zip / フォルダ / 箱を取り込む (画面なし)
    [string[]]$Rename = @(),     # 取り込んだ MOD の名前を変える (画面なし): -Rename <今の名前>,<新しい名前>
    [string[]]$SetPreview = @(), # 見本の画像を差し替える (画面なし): -SetPreview <種類>,<選択肢>,<画像>
    [string]$Inspect = '',       # 箱 (.utoc) の中身と該当する項目を出す (検査用)
    [string]$Shot = '',
    [int]$ShotTab = 0,
    [string]$ShotItem = '',      # 検査用: 右の一覧に出す項目
    [string]$ShotMod = '',       # 検査用: MOD 管理で選ぶ MOD
    [string]$ShotLang = '',      # 検査用: 言語 (設定は変えない)
    [string]$ShotSize = '',      # 検査用: 窓の中の大きさ (例 1280x800)
    [switch]$ModList,            # MOD 管理の一覧 (画面なし)
    [string]$ModOn = '',         # ~mods の外に外した MOD を戻す (画面なし)
    [string]$ModOff = ''         # ~mods の MOD を外す (画面なし)
)
$ErrorActionPreference = 'Stop'
$InvocationOptions = @{} + $PSBoundParameters
$ARG_ROOT = $GameRoot
$ARG_SEL = @{ body = $Body; hair = $Hair; beard = $Beard; eyes = $Eyes; romance = $Romance; coen_uw = $CoenUw; anca_body = $AncaBody; lacra_body = $LacraBody; marat_body = $MaratBody; marat_romance = $MaratRomance; anca_hair = $AncaHair; lacra_hair = $LacraHair; lacra_eyes = $LacraEyes; playas = $PlayAs
             anca_scope = $AncaScope; lacra_scope = $LacraScope; marat_scope = $MaratScope; anca_outfit = $AncaOutfit; lacra_outfit = $LacraOutfit; marat_outfit = $MaratOutfit
             marat_hair = $MaratHair; marat_beard = $MaratBeard
             hair_color = $HairColor; beard_color = $BeardColor; anca_hair_color = $AncaHairColor; lacra_hair_color = $LacraHairColor; marat_hair_color = $MaratHairColor; marat_beard_color = $MaratBeardColor
             genitals = $Genitals; marat_genitals = $MaratGenitals
             skin = $Skin; anca_skin = $AncaSkin; lacra_skin = $LacraSkin; marat_skin = $MaratSkin }
$ARG_EXT = $Ext
$SYS_UI_CULTURE = ''; try { $SYS_UI_CULTURE = (Get-UICulture).Name } catch { }
$SYS_CULTURE = ''; try { $SYS_CULTURE = (Get-Culture).Name } catch { }
[System.Threading.Thread]::CurrentThread.CurrentCulture = [System.Globalization.CultureInfo]::InvariantCulture
[System.Threading.Thread]::CurrentThread.CurrentUICulture = [System.Globalization.CultureInfo]::InvariantCulture

$PRODUCT = 'ELSB'
$PRODUCT_SUB = 'Character Body Customization Toolkit'
$PRODUCT_FULL = $PRODUCT + ' ' + [string][char]0x2014 + ' ' + $PRODUCT_SUB
$TOOL_VER = 'v1.1.1'
$IS_DEV = Test-Path -LiteralPath (Join-Path $PSScriptRoot 'ELSB.dev')      # 検証用のフォルダ (リリース版には入れない)
$PAKS_REL = 'Dawnwalker\Content\Paks\~mods'
$MOD_DIR  = Join-Path $PSScriptRoot 'Payload/ELSB'
$EXT_DIR  = Join-Path $PSScriptRoot 'modules/external'
$CORE_DIR = Join-Path $MOD_DIR '_core'     # いつも置く箱 (ELSB_ZCore*_P)。種類ではないので選択肢には出ない
# 互換 (v1.1): 他の作者の衣装 MOD を ELSB の体に合わせた箱。modules\compat\<id>\ に manifest.json + 箱 (0ELSB_Compat*_P) + preview.png。
#   取り込んだ MOD の箱 (.ucas/.utoc の SHA256) が manifest と同じで、その MOD を置き、requires (体型・範囲) を満たすときだけ置く。
#   名前は数字の 0 で始める: 小文字で比べると英字より小さいので、相手の箱 (A_… など) と ELSB の範囲の箱の両方に勝つ
$COMPAT_DIR = Join-Path $MOD_DIR 'compat'
$COMPAT_PREFIX = '0ELSB_Compat'
$INI_PATH = Join-Path $PSScriptRoot 'ELSB.ini'
$OLD_INI  = Join-Path $PSScriptRoot 'Goldwalker.ini'     # v0.12 までの設定。ELSB.ini が無ければ写して引き継ぐ
if (-not $Plan -and -not $LibraryOnly -and -not (Test-Path -LiteralPath $INI_PATH) -and (Test-Path -LiteralPath $OLD_INI)) { try { Copy-Item -LiteralPath $OLD_INI -Destination $INI_PATH } catch { } }
# box = 箱の名前 (_P の前が「種類の名前」)。選択肢のフォルダと ~mods では、<種類の名前> で始まり _P で終わる 3 つ組を全部その種類の箱とみなす
#   (例: アンカの体型 = GoldwalkerAncaBody_P (網目と肌) + GoldwalkerAncaBodyBDP_P (裸の設定の向け直し))。tab = 並べるタブ
#   needs = この項目は、needs の項目が Goldwalker の選択肢のときだけ置く (体型がバニラ・他の MOD のときに「全部の場面」を置くと体が消えるため)
#   first = 先頭の選択肢の呼び名 (既定は「バニラ」)。hideEmpty = 選択肢が無ければ項目ごと隠す (取り込んだ MOD が該当すると出る)
#   pair = 選択肢の中を、pair の項目の選択で分ける (<選択肢>\<pair の選択肢 | _vanilla>\ の箱を置く。マラトの髭の色: 髭ごとに材質が違う)
#   pairBy = 名前の頭が合う選択肢だけ、その項目の選択で分ける (フォルダの中に <その項目の選択肢 | _vanilla> があるとき。無い選択は _vanilla。操作キャラのマラト → マラトの服)
#   scope = 選んだら「新しい体を入れる場面」を「全部の場面」にする項目 (服の MOD)。fallback = 見本が無いときに代わりに見せる項目
#   sec = 画面のまとまり (body 体 / head 頭 / scene 場面 / dev 検証用)。devOnly = 検証用のフォルダ (ELSB.dev) だけで出す項目
#   v1.1 (10-02): anyExt = 取り込んだ MOD を、ファイルの重なりが無くてもこの項目に並べられる (MOD 管理の「選ぶ項目」に出る。性器の MOD)。
#     partItem = 互換の部分 (manifest の parts の item) を選択肢 'part:<互換の id>/<部分の id>' として並べる (相手の MOD を置くかとは別に選ぶ)
#   v1.1 (10-02 分家): overlay = 取り込んだ MOD を選んでも、その MOD が重なる項目 (体型など) を置き換えない (ELSB の選択のまま一緒に置く)。
#     肌・メイク・タトゥの項目 (skin・anca_skin・lacra_skin・marat_skin)。肌の画像だけの MOD は取り込むとここに並ぶ (Get-SkinSlot)。
#     重なる画像は MOD が勝つ: MOD の箱の名前が名前の順で ELSB_ より後ろなら、~mods には頭に 0ELSB_Skin_ を付けた名前で置く (Get-ExtPlaceName)
#     ただし互換の箱 (0ELSB_Compat…) と同じ画像を替えるときは互換が勝つ (名前の順で c < s。例: Coen's Nude Mod の互換の脚の画像とコーエンの脚のタトゥ)
$KINDS = @(
    @{ key = 'body';          box = 'ELSB_Body_P';          dir = 'body';          tab = 'coen'; sec = 'body' },
    @{ key = 'hair';          box = 'ELSB_Hair_P';          dir = 'hair';          tab = 'coen'; sec = 'head' },
    @{ key = 'hair_color';    box = 'ELSB_0ColorHair_P';    dir = 'hair_color';    tab = 'coen'; sec = 'head' },
    @{ key = 'beard';         box = 'ELSB_Beard_P';         dir = 'beard';         tab = 'coen'; first = 'none'; sec = 'head' },
    @{ key = 'beard_color';   box = 'ELSB_0ColorBeard_P';   dir = 'beard_color';   tab = 'coen'; sec = 'head' },
    @{ key = 'eyes';          box = 'ELSB_Eyes_P';          dir = 'eyes';          tab = 'coen'; sec = 'head' },
    @{ key = 'romance';       box = 'ELSB_Romance_P';       dir = 'romance';       tab = 'coen'; sec = 'scene' },
    @{ key = 'coen_uw';       box = 'ELSB_Underwear_P';     dir = 'coen_uw';       tab = 'coen'; first = 'uwOn'; sec = 'body' },
    @{ key = 'genitals';      box = 'ELSB_Genitals_P';      dir = 'genitals';      tab = 'coen'; first = 'genitalsNone'; hideEmpty = $true; anyExt = $true; fallback = 'body'; sec = 'body' },
    @{ key = 'skin';          box = 'ELSB_Skin_P';          dir = 'skin';          tab = 'coen'; first = 'skinNone'; hideEmpty = $true; anyExt = $true; overlay = $true; sec = 'body' },
    @{ key = 'playas';        box = 'ELSB_PlayAs_P';        dir = 'playas';        tab = 'coen'; first = 'playasNone'; pairBy = @{ 'marat_' = 'marat_outfit'; 'lacra_' = 'lacra_scope' }; sec = 'dev'; devOnly = $true },
    @{ key = 'anca_body';     box = 'ELSB_AncaBody_P';      dir = 'anca_body';     tab = 'anca'; sec = 'body' },
    @{ key = 'anca_hair';     box = 'ELSB_AncaHair_P';      dir = 'anca_hair';     tab = 'anca'; sec = 'head' },
    @{ key = 'anca_hair_color'; box = 'ELSB_0ColorAncaHair_P'; dir = 'anca_hair_color'; tab = 'anca'; sec = 'head' },
    @{ key = 'anca_scope';    box = 'ELSB_AncaScope_P';     dir = 'anca_scope';    tab = 'anca'; needs = 'anca_body'; first = 'scopeNaked'; fallback = 'anca_body'; sec = 'body' },
    @{ key = 'anca_outfit';   box = 'ELSB_AncaOutfit_P';    dir = 'anca_outfit';   tab = 'anca'; hideEmpty = $true; scope = 'anca_scope'; fallback = 'anca_body'; sec = 'body' },
    @{ key = 'anca_skin';     box = 'ELSB_AncaSkin_P';      dir = 'anca_skin';     tab = 'anca'; first = 'skinNone'; hideEmpty = $true; anyExt = $true; overlay = $true; sec = 'body' },
    @{ key = 'lacra_body';    box = 'ELSB_LacraBody_P';     dir = 'lacra_body';    tab = 'lacra'; sec = 'body' },
    @{ key = 'lacra_hair';    box = 'ELSB_LacraHair_P';     dir = 'lacra_hair';    tab = 'lacra'; sec = 'head' },
    @{ key = 'lacra_hair_color'; box = 'ELSB_0ColorLacraHair_P'; dir = 'lacra_hair_color'; tab = 'lacra'; sec = 'head' },
    @{ key = 'lacra_eyes';    box = 'ELSB_LacraEyes_P';     dir = 'lacra_eyes';    tab = 'lacra'; sec = 'head' },
    @{ key = 'lacra_scope';   box = 'ELSB_LacraScope_P';    dir = 'lacra_scope';   tab = 'lacra'; needs = 'lacra_body'; first = 'scopeNaked'; fallback = 'lacra_body'; sec = 'body' },
    @{ key = 'lacra_outfit';  box = 'ELSB_LacraOutfit_P';   dir = 'lacra_outfit';  tab = 'lacra'; hideEmpty = $true; scope = 'lacra_scope'; fallback = 'lacra_body'; sec = 'body' },
    @{ key = 'lacra_skin';    box = 'ELSB_LacraSkin_P';     dir = 'lacra_skin';    tab = 'lacra'; first = 'skinNone'; hideEmpty = $true; anyExt = $true; overlay = $true; sec = 'body' },
    @{ key = 'marat_body';    box = 'ELSB_MaratBody_P';     dir = 'marat_body';    tab = 'marat'; sec = 'body' },
    @{ key = 'marat_scope';   box = 'ELSB_MaratScope_P';    dir = 'marat_scope';   tab = 'marat'; needs = 'marat_body'; first = 'scopeNaked'; fallback = 'marat_body'; sec = 'body' },
    @{ key = 'marat_romance'; box = 'ELSB_MaratRomance_P';  dir = 'marat_romance'; tab = 'marat'; sec = 'scene' },
    @{ key = 'marat_hair';    box = 'ELSB_MaratHair_P';     dir = 'marat_hair';    tab = 'marat'; sec = 'head' },
    @{ key = 'marat_hair_color'; box = 'ELSB_0ColorMaratHair_P'; dir = 'marat_hair_color'; tab = 'marat'; sec = 'head' },
    @{ key = 'marat_beard';   box = 'ELSB_MaratBeard_P';    dir = 'marat_beard';   tab = 'marat'; sec = 'head' },
    @{ key = 'marat_beard_color'; box = 'ELSB_0ColorMaratBeard_P'; dir = 'marat_beard_color'; tab = 'marat'; pair = 'marat_beard'; sec = 'head' },
    @{ key = 'marat_outfit';  box = 'ELSB_MaratOutfit_P';   dir = 'marat_outfit';  tab = 'marat'; hideEmpty = $true; scope = 'marat_scope'; fallback = 'marat_body'; sec = 'body' },
    @{ key = 'marat_genitals'; box = 'ELSB_MaratGenitals_P'; dir = 'marat_genitals'; tab = 'marat'; first = 'genitalsNone'; hideEmpty = $true; partItem = $true; fallback = 'marat_body'; sec = 'body' },
    @{ key = 'marat_skin';    box = 'ELSB_MaratSkin_P';     dir = 'marat_skin';    tab = 'marat'; first = 'skinNone'; hideEmpty = $true; anyExt = $true; overlay = $true; sec = 'body' }
)
if (-not $IS_DEV) { $KINDS = @($KINDS | Where-Object { -not $_.devOnly }) }     # リリース版には検証用の項目 (操作キャラ) を出さない
$KIND_BY_KEY = @{}; foreach ($k0 in $KINDS) { $KIND_BY_KEY[$k0.key] = $k0 }     # key → 項目 (画面の描画で何百回も引くので表で)
$SECTIONS = @('body', 'head', 'scene', 'dev')                                    # 画面の項目のまとまり (体・頭・場面・検証用)
$PARTNER_TABS = @('anca', 'lacra', 'marat')
$LEGACY = @('GoldwalkerTest_P', 'GoldwalkerLookTest_P', 'GoldwalkerNudeTest_P')    # GoldwalkerUnderwear_P は v0.12 で項目 (coen_uw) に戻した
# v1.0.1: 箱の名前を Goldwalker…_P (v1.0 まで) から ELSB_…_P に (本人「ちゃんと ELSB だと分かるファイル名に」)。頭を替えただけで中身と並びは同じ。
#   ~mods に残った前の名前の箱は ELSB の箱として見分け (今の状態の判定は名前を読み替える)、「適用」・「全部外す」で外して新しい名前で置き直す
$BOX_PREFIX = 'ELSB_'; $OLD_BOX_PREFIX = 'Goldwalker'
function Get-NewBoxName($n) { $s = [string]$n; if ($s.StartsWith($OLD_BOX_PREFIX)) { return $BOX_PREFIX + $s.Substring($OLD_BOX_PREFIX.Length) }; return $s }
function Get-OldNameBoxes($paks) {
    $out = @()
    if (-not $paks -or -not (Test-Path -LiteralPath $paks)) { return $out }
    foreach ($f in @(Get-ChildItem -LiteralPath $paks -File -ErrorAction SilentlyContinue)) {
        $n = [IO.Path]::GetFileNameWithoutExtension($f.Name)
        if ($n -cmatch ('^' + $OLD_BOX_PREFIX + '[A-Za-z0-9]*_P$') -and $out -notcontains $n) { $out += $n }
    }
    return $out
}

# === LANG ===
$UI = @{
    ja = @{
        gameLabel = 'ゲームのフォルダ'; browse = '参照...'; notFound = 'ゲームが見つかりません。「参照...」で選んでください'
        found = 'ゲームを見つけました'; apply = '適用'; removeAll = '全部外す (バニラに戻す)'; close = '閉じる'; vanilla = 'バニラ (変えない)'; none = 'なし'
        body = '体型'; hair = '髪型'; beard = '髭'; eyes = '吸血鬼の目の色'; romance = 'ロマンスシーン'; coen_uw = '下着 (普段の場面)'; uwOn = 'あり (バニラ)'
        anca_body = 'アンカの体型'; lacra_body = 'ラクラの体型'; marat_body = 'マラトの体型'; marat_romance = 'マラトのロマンスシーン'
        anca_hair = 'アンカの髪型'; lacra_hair = 'ラクラの髪型'; lacra_eyes = 'ラクラの目の光 (吸血鬼)'; marat_hair = 'マラトの髪型'; marat_beard = 'マラトの髭'
        hair_color = '髪の色 (眉も)'; beard_color = '髭の色'; anca_hair_color = 'アンカの髪の色 (眉も)'; lacra_hair_color = 'ラクラの髪の色'; marat_hair_color = 'マラトの髪の色 (眉も)'; marat_beard_color = 'マラトの髭の色'
        playas = '操作キャラ (検証用)'; playasNone = 'コーエン (変えない)'
        anca_scope = 'アンカの体の場面'; lacra_scope = 'ラクラの体の場面'; marat_scope = 'マラトの体の場面'
        anca_outfit = 'アンカの服'; lacra_outfit = 'ラクラの服'; marat_outfit = 'マラトの服'
        genitals = '性器'; marat_genitals = 'マラトの性器'; genitalsNone = 'なし (バニラ)'
        skin = '肌・メイク・タトゥ'; anca_skin = 'アンカの肌・メイク・タトゥ'; lacra_skin = 'ラクラの肌・メイク・タトゥ'; marat_skin = 'マラトの肌・メイク・タトゥ'; skinNone = 'なし'
        scopeNaked = '裸の場面だけ (既定)'
        tabAnca = 'アンカ'; tabLacra = 'ラクラ'; tabMarat = 'マラト'
        partnerNote = '選んだ体型は、最初は裸の場面 (ロマンス) だけで使われます。服を着た場面でも使うには「体の場面」を「全部の場面」に。「服」を「裸」にすると、どの場面でも裸になります (体は「体型」で選んだ物)。服の MOD を取り込むと「服」で選べます'
        needsSkipped = '体型が ELSB ではないので、次の項目は置きませんでした: '
        pairSkipped = '組み合わせる物が無い (髭なし) ので、次の項目は置きませんでした: '
        applied = '置き換えました。ゲームを起動し直してください'; removed = '全部外しました'; noPreview = '見本なし'
        tabCoen = 'コーエン'
        extRemove = '一覧から消す'
        extRename = '名前を変える...'; extModTag = '[MOD] '
        msgRenameTitle = '新しい名前'; msgRenameExists = '同じ名前の MOD が既にあります: '
        picHint = '(ゲーム内のスクショをここにドラッグすると、この項目の見本になる)'; previewSet = '見本を差し替えました: '
        previewBad = 'この画像は読めませんでした (WebP を読むには Windows の「WebP 画像拡張機能」が要ります): '
        msgExeNotFound = '選んだフォルダの中にも上にも Dawnwalker\Binaries\Win64\Dawnwalker.exe が見つかりません。' + [Environment]::NewLine + 'ゲームの一番上のフォルダ (Dawnwalker と Engine が入っている場所) を選んでください。'
        msgRunning = 'ゲームが起動中です。ゲームを終了してから「適用」してください。'
        msgInsidePaks = 'この道具はゲームの Paks フォルダの中に置かないでください (中の箱が全部読み込まれてしまいます)。' + [Environment]::NewLine + 'ゲームの外のフォルダに移してから起動してください。'
        msgExtNothing = '箱 (.pak / .ucas / .utoc の 3 つ組) が見つかりませんでした: '
        msgNoExtractor = 'この書庫を開くソフト (7-Zip か WinRAR) が見つかりません。先に展開して、フォルダをドラッグしてください: '
        tagline = '主人公とロマンス相手の見た目を選ぶ'
        secBody = '体'; secHead = '頭'; secScene = '場面'; secDev = '検証用 (リリース版には出ない)'
        badge = '変更'; nowTip = '今の状態: '; usedBy = 'MOD「{0}」が置き換え中'
        changesN = '{0} 件の変更: {1}'; noChanges = '変更なし (今の状態のまま)'; revert = '元に戻す'
        chModOn = '「{0}」を有効に'; chModOff = '「{0}」を無効に'
        galleryCap = '{0}を選ぶ ({1})'; galleryHint = '画像を押すと選べる / 乗せると上の見本が替わる'
        tabMods = 'MOD 管理'
        modsHint = 'MOD (zip・rar・7z・フォルダ) をここにドラッグすると取り込めます。チェックした MOD は、人物のタブで選べます。人物のタブに出ない MOD は、チェックを外して「適用」するとゲームから外れます (ファイルは消えません)'
        modAdd = 'MOD を追加...'; modOpen = '~mods を開く'; modRescan = '読み直す'
        colMod = 'MOD'
        whereExt = '取り込んだ MOD'; whereMods = '~mods の MOD'; whereOff = '外してある MOD'
        secElsb = 'ELSB との関係'; secOther = 'ほかの MOD との関係'; itemQ = '「{0}」'; condFmt = '「{0}」を「{1}」'; coreName = '共通部分'
        relOk = 'ELSB と一緒に使えます。'; relOverlay = 'ELSB と一緒に使えます。ELSB の体の上に、この MOD の肌・メイク・タトゥが出ます。'; relTake = 'ただし、この MOD を選ぶと、ELSB の{0}はこの MOD に置き換わります (その間は選べません)。'
        statusOk = 'ELSB と併用 OK'; statusTake = 'ELSB の一部を置き換える'; statusClash = 'ELSB の一部とぶつかる'; statusPart = '今は一部が使われていない'; statusNone = '今は使われていない'
        rowSelected = '選択中'; rowListed = '選んでいない'; rowHidden = '人物のタブに出さない'
        elsbItem = 'ELSB「{0}」'; elsbCore = 'ELSB (共通)'; elsbCompat = 'ELSB の互換「{0}」'
        relCompat = 'ELSB と一緒に使えます。ELSB の体に合わせた版があります。'; relCompatHow = '使い方: 「{0}」でこの MOD を選び、{1}にして「適用」。'; relCompatHow2 = '使い方: {0}にして「適用」。'; relCantUse = 'ELSB の体に合わせた版がありますが、この MOD のファイル名が先に読み込まれるため使えません (作者の元の形で入ります)。'
        partApplied = '{0}: ELSB の体に合わせた版がゲームに入っています。'; partPending = '{0}: 「適用」を押すと、ELSB の体に合わせた版が入ります。'; partHow = '{0}: {1}にすると、ELSB の体に合わせた版が使われます。'; partCantUse = '{0}: この MOD のファイル名が先に読み込まれるため、ELSB の体に合わせた版を使えません。'
        relClash = 'ELSB の{0}と同じ所を変えるので、一緒には使えません ({1})。'; clashElsb = '一緒に入れると ELSB の方が使われます'; clashMod = '一緒に入れると、この MOD の方が使われます'; clashMixed = '一緒に入れると、一部は ELSB、一部はこの MOD が使われます'; relClashFix = 'この MOD を使うときは、{0}にしてください。'
        nowApplied = '今: ゲームに入っています。'; nowPending = '今: 「適用」を押すとゲームに入ります。'; nowOriginal = '今: 条件が足りないので、作者の元の形で入ります。'; nowOff = '今: この MOD を選んでいません。'; nowTaken = '今: ELSB の{0}は、この MOD に置き換わっています。'
        nowClash = '今: ぶつかっています (ELSB の{0}を使っているため)。'; nowClashIdle = '今: ELSB の{0}を使っているので、この MOD を入れるとぶつかります。'; nowFree = '今: ぶつかっていません (ELSB の{0}を使っていないため)。'
        otherAlt = '{0}: 同じ「{1}」の MOD です。選べるのはどちらか 1 つです。'; otherWin = '{0}: 同じ所を変えます。この MOD の方が使われます。'; otherLose = '{0}: 同じ所を変えます。{0} の方が使われます。'; otherNone = 'ぶつかる MOD はありません。'
        compatSkipped = 'ELSB の体に合わせた版を使えなかった MOD (MOD のファイル名が先に読み込まれるため): '; compatDtSkipped = 'ELSB の体に合わせた版を使えなかった MOD (この版の ELSB に合わないため、作り直しが必要): '
        badgeApplied = 'ELSB 適用済'; badgeNotApplied = 'ELSB 対応・未適用'; badgeCantUse = 'ELSB 対応・使えない'; badgeAvail = 'ELSB 対応'; extCompatTag = ' (ELSB 対応)'
        badgeImport = 'ELSB 対応 (取り込むと使えます)'; modImport = '取り込む'
        subjCoen = 'コーエン'; subjAnca = 'アンカ'; subjLacra = 'ラクラ'; subjMarat = 'マラト'; subjWomen = '女性全員'; subjMen = '男性全員'; subjOther = 'ほかの人物'; subjNone = '見た目以外'
        modItemCap = '人物のタブで選ぶ場所'; modItemNone = 'なし (チェックで入れる・外す)'
        modGeneral = 'この MOD は人物のタブには出ません。チェックで入れる・外すを切り替えます。'
        modFilesCap = 'この MOD が変えるファイル'
        modUnreadable = '古い形式なので中身を調べられません'
        modNone = 'MOD はありません'; modPick = 'MOD を選ぶと、ここに説明が出ます'
        modAdded = '取り込みました: '; modAddedPreview = ' (見本の画像あり)'; msgMoveFail = 'ファイルを移せませんでした: '
        applying = '適用しています...'; applyFailed = '適用の途中で止まりました: '
        applyFailedNote = '一部の項目だけ置き換わった可能性があります。画面は今の実際の状態に戻しました。ゲームを閉じているか、ファイルを使っているソフトが無いかを確かめてから、もう一度「適用」してください。'
        modExists = '移す先に同じ名前のファイルがあるので移しませんでした (上書きしません): '
        confirmRemoveExt = '取り込んだ MOD「{0}」を一覧から消しますか？' + [Environment]::NewLine + '(ELSB に取り込んだ写しと、~mods に置いた分を消します。元の zip などは消えません)'
        relReady = 'ELSB の体に合わせた版がある MOD です。ただし、この ELSB にはまだ取り込まれていません。'; relReadyHow = '下の「取り込む」を押すと、人物のタブで選べるようになり、体に合わせた版も使われます。'
        nowReadyPlaced = '今: 体に合わせた版がゲームに入っています (前の版や別のフォルダの ELSB で置いた物)。取り込まずに「適用」すると外れます。'
        modDirect = 'ゲームの ~mods に直接入っている MOD です。外すときは、チェックを外して「適用」(消さずに ELSB_DisabledMods へ移します)。'; modDirectImport = '人物のタブで選ぶには、下の「取り込む」を押してください。'
        modOffNote = '外してある MOD です (ELSB_DisabledMods にあります)。戻すときは、チェックを入れて「適用」。'
        confirmImportMods = '「{0}」を ELSB に取り込みますか？' + [Environment]::NewLine + '(取り込むと、人物のタブで選べるようになります。ゲームのファイルはそのままです)'
        confirmRemoveExtMods = '取り込んだ MOD「{0}」を一覧から消しますか？' + [Environment]::NewLine + '(ELSB の中の写しを消します。ゲームの ~mods のファイルは、取り込む前と同じように残します)'
        confirmOrphanCompat = '「適用」すると、次の MOD の ELSB の体に合わせた版がゲームから外れます:' + [Environment]::NewLine + '{0}' + [Environment]::NewLine + '' + [Environment]::NewLine + 'この ELSB にその MOD が取り込まれていないためです (前の版や別のフォルダの ELSB で置いた物)。' + [Environment]::NewLine + '外したくないときは「いいえ」を押し、MOD 管理でその MOD を選んで「取り込む」を押してください。' + [Environment]::NewLine + '' + [Environment]::NewLine + 'このまま適用しますか？'
        confirmRemoveAll = 'ELSB の箱を ~mods から全部外して、見た目をバニラに戻しますか？ (ほかの MOD はそのまま)'
        oldNames = 'v1.0 の古いファイル名 (Goldwalker…) の箱が ~mods にあります。「適用」を押すと新しい名前 (ELSB_…) で置き直します'
        importExists = '同じ名前の MOD「{0}」が既に取り込まれています。置き換えますか？' + [Environment]::NewLine + '(はい = 置き換える / いいえ = 別の名前で取り込む)'
    }
    en = @{
        gameLabel = 'Game folder'; browse = 'Browse...'; notFound = 'Game not found. Use "Browse..." to select it'
        found = 'Game found'; apply = 'Apply'; removeAll = 'Remove all (back to vanilla)'; close = 'Close'; vanilla = 'Vanilla (unchanged)'; none = 'None'
        body = 'Body'; hair = 'Hairstyle'; beard = 'Beard'; eyes = 'Vampire eye color'; romance = 'Romance scenes'; coen_uw = 'Underwear (normal scenes)'; uwOn = 'On (vanilla)'
        anca_body = "Anca's body"; lacra_body = "Lacra's body"; marat_body = "Marat's body"; marat_romance = "Marat's romance scenes"
        anca_hair = "Anca's hairstyle"; lacra_hair = "Lacra's hairstyle"; lacra_eyes = "Lacra's eye glow (vampire)"; marat_hair = "Marat's hairstyle"; marat_beard = "Marat's beard"
        hair_color = 'Hair color (and brows)'; beard_color = 'Beard color'; anca_hair_color = "Anca's hair color (and brows)"; lacra_hair_color = "Lacra's hair color"; marat_hair_color = "Marat's hair color (and brows)"; marat_beard_color = "Marat's beard color"
        playas = 'Play as (for testing)'; playasNone = 'Coen (unchanged)'
        anca_scope = "Anca's body scenes"; lacra_scope = "Lacra's body scenes"; marat_scope = "Marat's body scenes"
        anca_outfit = "Anca's outfit"; lacra_outfit = "Lacra's outfit"; marat_outfit = "Marat's outfit"
        genitals = 'Genitals'; marat_genitals = "Marat's genitals"; genitalsNone = 'None (vanilla)'
        skin = 'Skin, makeup and tattoos'; anca_skin = "Anca's skin, makeup and tattoos"; lacra_skin = "Lacra's skin, makeup and tattoos"; marat_skin = "Marat's skin, makeup and tattoos"; skinNone = 'None'
        scopeNaked = 'Naked scenes only (default)'
        tabAnca = 'Anca'; tabLacra = 'Lacra'; tabMarat = 'Marat'
        partnerNote = 'At first, the chosen body is used only in naked (romance) scenes. To use it in clothed scenes too, set "Body scenes" to "All scenes". Set "Outfit" to "Naked" to be naked in every scene (with the body chosen in "Body"). Imported outfit mods can be chosen in "Outfit"'
        needsSkipped = 'Not placed because the body is not ELSB: '
        pairSkipped = 'Not placed because there is nothing to combine it with (no beard): '
        applied = 'Applied. Restart the game'; removed = 'All removed'; noPreview = 'No preview'
        tabCoen = 'Coen'
        extRemove = 'Remove from list'
        extRename = 'Rename...'; extModTag = '[MOD] '
        msgRenameTitle = 'New name'; msgRenameExists = 'A mod with that name already exists: '
        picHint = '(drop an in-game screenshot here to use it as the preview of this item)'; previewSet = 'Preview replaced: '
        previewBad = 'Could not read this image (WebP needs the Windows "WebP Image Extensions"): '
        msgExeNotFound = 'Dawnwalker\Binaries\Win64\Dawnwalker.exe was not found in the selected folder or above it.' + [Environment]::NewLine + 'Please select the top game folder (the one that contains "Dawnwalker" and "Engine").'
        msgRunning = 'The game is running. Close it before applying.'
        msgInsidePaks = 'Do not place this tool inside the game''s Paks folder (all containers inside would be loaded).' + [Environment]::NewLine + 'Move it outside the game folder and start again.'
        msgExtNothing = 'No container (.pak / .ucas / .utoc triple) found in: '
        msgNoExtractor = 'No archiver (7-Zip or WinRAR) found to open this archive. Extract it first and drop the folder: '
        tagline = 'Choose how Coen and the romance partners look'
        secBody = 'Body'; secHead = 'Head'; secScene = 'Scenes'; secDev = 'Testing (not in the release)'
        badge = 'Changed'; nowTip = 'Current: '; usedBy = 'Replaced by mod "{0}"'
        changesN = '{0} change(s): {1}'; noChanges = 'No changes'; revert = 'Undo changes'
        chModOn = 'turn on "{0}"'; chModOff = 'turn off "{0}"'
        galleryCap = 'Choose {0} ({1})'; galleryHint = 'Click an image to choose it / hover to preview it above'
        tabMods = 'Mods'
        modsHint = 'Drag a mod (zip, rar, 7z or folder) here to add it. Checked mods can be chosen on the character tabs. Mods that are not on a character tab are taken out of the game when you uncheck them and press Apply (no files are deleted)'
        modAdd = 'Add mod...'; modOpen = 'Open ~mods'; modRescan = 'Refresh'
        colMod = 'Mod'
        whereExt = 'Imported mod'; whereMods = 'Mod in ~mods'; whereOff = 'Turned-off mod'
        secElsb = 'With ELSB'; secOther = 'With other mods'; itemQ = '"{0}"'; condFmt = '"{0}" to "{1}"'; coreName = 'shared files'
        relOk = 'Works with ELSB.'; relOverlay = 'Works with ELSB. This mod''s skin, makeup or tattoos show on the ELSB body.'; relTake = 'But while this mod is chosen, it replaces ELSB''s {0} (which can''t be chosen then).'
        statusOk = 'Works with ELSB'; statusTake = 'Replaces part of ELSB'; statusClash = 'Conflicts with part of ELSB'; statusPart = 'Partly not used now'; statusNone = 'Not used now'
        rowSelected = 'selected'; rowListed = 'not selected'; rowHidden = 'hidden from the character tabs'
        elsbItem = 'ELSB "{0}"'; elsbCore = 'ELSB (shared)'; elsbCompat = 'ELSB compatibility "{0}"'
        relCompat = 'Works with ELSB. A version fitted to the ELSB body is included.'; relCompatHow = 'To use it: choose this mod in "{0}", set {1}, then press Apply.'; relCompatHow2 = 'To use it: set {0}, then press Apply.'; relCantUse = 'A version fitted to the ELSB body is included, but it can''t be used because this mod''s file name loads first (the author''s original shape is used).'
        partApplied = '{0}: the version fitted to the ELSB body is in the game.'; partPending = '{0}: press Apply to put the version fitted to the ELSB body in the game.'; partHow = '{0}: set {1} to use the version fitted to the ELSB body.'; partCantUse = '{0}: the version fitted to the ELSB body can''t be used because this mod''s file name loads first.'
        relClash = 'Changes the same parts as ELSB''s {0}, so they can''t be used together ({1}).'; clashElsb = 'if both are in, ELSB''s is used'; clashMod = 'if both are in, this mod''s is used'; clashMixed = 'if both are in, some parts come from ELSB and some from this mod'; relClashFix = 'To use this mod, set {0}.'
        nowApplied = 'Now: it is in the game.'; nowPending = 'Now: press Apply to put it in the game.'; nowOriginal = 'Now: the conditions are not met, so the author''s original shape is used.'; nowOff = 'Now: this mod is not selected.'; nowTaken = 'Now: ELSB''s {0} is replaced by this mod.'
        nowClash = 'Now: they conflict (ELSB''s {0} is in use).'; nowClashIdle = 'Now: ELSB''s {0} is in use, so this mod would conflict if turned on.'; nowFree = 'Now: no conflict (ELSB''s {0} is not in use).'
        otherAlt = '{0}: another mod for "{1}". Only one of them can be chosen.'; otherWin = '{0}: changes the same parts. This mod is used.'; otherLose = '{0}: changes the same parts. {0} is used.'; otherNone = 'No conflicts with other mods.'
        compatSkipped = 'ELSB-ready version not used (the mod''s file name loads first): '; compatDtSkipped = 'ELSB-ready version not used (it does not match this ELSB version and needs an update): '
        badgeApplied = 'ELSB-ready, applied'; badgeNotApplied = 'ELSB-ready, not applied'; badgeCantUse = 'ELSB-ready, can''t use'; badgeAvail = 'ELSB-ready'; extCompatTag = ' (ELSB-ready)'
        badgeImport = 'ELSB-ready (import to use)'; modImport = 'Import'
        subjCoen = 'Coen'; subjAnca = 'Anca'; subjLacra = 'Lacra'; subjMarat = 'Marat'; subjWomen = 'All women'; subjMen = 'All men'; subjOther = 'Other characters'; subjNone = 'Not appearance'
        modItemCap = 'Where to choose it on the character tabs'; modItemNone = 'None (turn it on or off with the check box)'
        modGeneral = 'This mod does not appear on the character tabs. Use the check box to turn it on or off.'
        modFilesCap = 'Files this mod changes'
        modUnreadable = 'Old format: the contents can''t be checked'
        modNone = 'No mods'; modPick = 'Select a mod to see the details here'
        modAdded = 'Imported: '; modAddedPreview = ' (with preview image)'; msgMoveFail = 'Could not move files: '
        applying = 'Applying...'; applyFailed = 'Apply stopped partway: '
        applyFailedNote = 'Some items may have been changed. The window now shows the actual current state. Make sure the game is closed and no other program is using the files, then press Apply again.'
        modExists = 'Not moved because a file with the same name is already there (nothing is overwritten): '
        confirmRemoveExt = 'Remove the imported mod "{0}" from the list?' + [Environment]::NewLine + '(Deletes the copy imported into ELSB and its files in ~mods. Your original zip etc. is not touched.)'
        relReady = 'An ELSB-ready mod (a version fitted to the ELSB body is included), but it is not imported into this copy of ELSB yet.'; relReadyHow = 'Press "Import" below to choose it on the character tabs and use the fitted version.'
        nowReadyPlaced = 'Now: the fitted version is in the game (placed by an earlier version or another folder of ELSB). If you press Apply without importing, it is taken out.'
        modDirect = 'This mod sits directly in the game''s ~mods. To take it out, uncheck it and press Apply (it is moved to ELSB_DisabledMods, not deleted).'; modDirectImport = 'To choose it on the character tabs, press "Import" below.'
        modOffNote = 'This mod is turned off (it is in ELSB_DisabledMods). To put it back, check it and press Apply.'
        confirmImportMods = 'Import "{0}" into ELSB?' + [Environment]::NewLine + '(It can then be chosen on the character tabs. The game files stay as they are.)'
        confirmRemoveExtMods = 'Remove the imported mod "{0}" from the list?' + [Environment]::NewLine + '(This deletes ELSB''s copy. The files in the game''s ~mods stay as they were before importing.)'
        confirmOrphanCompat = 'Apply will take the ELSB-fitted versions of these mods out of the game:' + [Environment]::NewLine + '{0}' + [Environment]::NewLine + '' + [Environment]::NewLine + 'They are not imported into this copy of ELSB (they were placed by an earlier version or another folder of ELSB).' + [Environment]::NewLine + 'To keep them, press No, then select the mod in the Mods tab and press Import.' + [Environment]::NewLine + '' + [Environment]::NewLine + 'Apply anyway?'
        confirmRemoveAll = 'Remove all ELSB files from ~mods and return the characters to vanilla? (Other mods are not touched.)'
        oldNames = 'Files with the old v1.0 names (Goldwalker...) are in ~mods. Press Apply to replace them with the new names (ELSB_...).'
        importExists = 'A mod named "{0}" is already imported. Replace it?' + [Environment]::NewLine + '(Yes = replace / No = import under a new name)'
    }
}
$NAMES = @{
    ja = @{
        'Ambrus_A' = 'アンブルスの髪'; 'Andrei_A' = 'アンドレイの髪'; 'CitTorsoG_B' = '町人の髪 B'; 'CitTorsoG_D' = '町人の髪 D'; 'CitTorsoG_H' = '町人の髪 H'
        'Commoner_A' = '村人の髪 A'; 'Commoner_B' = '村人の髪 B'; 'Commoner_C' = '村人の髪 C'; 'Commoner_D' = '村人の髪 D'; 'Commoner_E' = '村人の髪 E (編み込み)'; 'Commoner_F' = '村人の髪 F'
        'Florin_A' = 'フロリンの髪'; 'Isbrand_A' = 'イスブランドの髪'; 'Marat_B' = 'マラトの髪 (結い)'; 'Marat_C' = 'マラトの髪 (おろし)'
        'Mihai_A' = 'ミハイの髪'; 'Vicho_A' = 'ヴィチョの髪'
        'beard/Andrei_A' = 'アンドレイの髭'; 'beard/Commoner_A' = '村人の髭 A'; 'beard/Commoner_B' = '村人の髭 B'; 'beard/Commoner_C' = '村人の髭 C'; 'beard/Commoner_D' = '村人の髭 D'; 'beard/Commoner_E' = '村人の髭 E'
        'beard/Villager_A' = '村人の髭 (別型)'; 'beard/Marat_A' = 'マラトの髭'; 'beard/Neberu_A' = 'ネベルの髭 A'; 'beard/Neberu_A1' = 'ネベルの髭 A1'; 'beard/Pieter_A' = 'ピーテルの髭'
        'eyes/red' = '赤'; 'eyes/blue' = '青'; 'eyes/green' = '緑'; 'eyes/yellow' = '黄'; 'eyes/orange' = 'オレンジ'; 'eyes/purple' = '紫'
        'romance/undress' = '脱ぐ (バニラでパンツ一丁になる場面)'
        'coen_uw/off' = 'なし (普段の場面も脱ぐ)'
        'body/masculine' = 'ELSB'; 'anca_body/booty' = 'ELSB'; 'lacra_body/fitness' = 'ELSB'
        'marat_body/fitness' = 'ELSB'; 'marat_romance/undress' = '脱ぐ (バニラでパンツ一丁の場面)'
        'anca_scope/all' = '全部の場面'; 'lacra_scope/all' = '全部の場面'; 'marat_scope/all' = '全部の場面'
        'anca_hair/Anca_B' = 'アンカの髪 B (まとめ髪)'; 'anca_hair/Esme_A' = 'エスメの髪'; 'anca_hair/Yanna_H' = 'ヤナの髪'; 'anca_hair/Commoner_C' = '村の女性の髪 C'; 'anca_hair/Commoner_E' = '村の女性の髪 E'; 'anca_hair/Villager_H' = '村の女性の髪 H'
        'lacra_hair/Commoner_A' = '村の女性の髪 A'; 'lacra_hair/Commoner_B' = '村の女性の髪 B'; 'lacra_hair/Commoner_C' = '村の女性の髪 C'; 'lacra_hair/Commoner_E' = '村の女性の髪 E'; 'lacra_hair/Villager_H' = '村の女性の髪 H'
        'lacra_hair/Esme_A' = 'エスメの髪'; 'lacra_hair/Yanna_H' = 'ヤナの髪'; 'lacra_hair/Sarah_A' = 'サラの髪'; 'lacra_hair/XanthesDaughter_A' = 'クサンテの娘の髪'
        'playas/anca_A' = 'アンカ (普段の服)'; 'playas/anca_naked' = 'アンカ (裸)'; 'playas/lacra_A' = 'ラクラ (普段の服)'; 'playas/lacra_E' = 'ラクラ (上着 B)'; 'playas/lacra_naked' = 'ラクラ (裸)'
        'playas/marat_A' = 'マラト (普段の服)'; 'playas/marat_C' = 'マラト (上半身裸)'; 'playas/marat_D' = 'マラト (シャツ)'; 'playas/marat_naked' = 'マラト (裸)'
        'anca_outfit/nude' = '裸'; 'lacra_outfit/nude' = '裸'; 'marat_outfit/nude' = '裸'
        'marat_hair/Ambrus_A' = 'アンブルスの髪'; 'marat_hair/Commoner_B' = '村人の髪 B'; 'marat_hair/Commoner_D' = '村人の髪 D'; 'marat_hair/Commoner_F' = '村人の髪 F'; 'marat_hair/Isbrand_A' = 'イスブランドの髪'; 'marat_hair/Mihai_A' = 'ミハイの髪'
        'marat_beard/0_none' = 'なし (剃る)'; 'marat_beard/Andrei_A' = 'アンドレイの髭 (薄い無精ひげ)'; 'marat_beard/Commoner_A' = '村人の髭 A (薄い無精ひげ)'; 'marat_beard/Commoner_B' = '村人の髭 B'; 'marat_beard/Commoner_C' = '村人の髭 C'; 'marat_beard/Commoner_D' = '村人の髭 D'; 'marat_beard/Commoner_E' = '村人の髭 E'
        'marat_beard/Villager_A' = '村人の髭 (別型)'; 'marat_beard/Neberu_A' = 'ネベルの髭 A'; 'marat_beard/Neberu_A1' = 'ネベルの髭 A1'; 'marat_beard/Pieter_A' = 'ピーテルの髭'
        '01_black' = '黒'; '02_darkbrown' = '焦げ茶'; '03_brown' = '茶'; '04_lightbrown' = '明るい茶'; '05_auburn' = '赤褐色'; '06_ginger' = '赤毛'; '07_darkblonde' = '暗い金'; '08_blonde' = '金'; '09_platinum' = 'プラチナ'; '10_saltpepper' = '白髪まじり'; '11_white' = '白髪'
        'lacra_eyes/red' = '赤'; 'lacra_eyes/blue' = '青'; 'lacra_eyes/green' = '緑'; 'lacra_eyes/yellow' = '黄'; 'lacra_eyes/orange' = 'オレンジ'; 'lacra_eyes/purple' = '紫'
    }
    en = @{
        'Ambrus_A' = "Ambrus's hair"; 'Andrei_A' = "Andrei's hair"; 'CitTorsoG_B' = 'Townsman hair B'; 'CitTorsoG_D' = 'Townsman hair D'; 'CitTorsoG_H' = 'Townsman hair H'
        'Commoner_A' = 'Villager hair A'; 'Commoner_B' = 'Villager hair B'; 'Commoner_C' = 'Villager hair C'; 'Commoner_D' = 'Villager hair D'; 'Commoner_E' = 'Villager hair E (braids)'; 'Commoner_F' = 'Villager hair F'
        'Florin_A' = "Florin's hair"; 'Isbrand_A' = "Isbrand's hair"; 'Marat_B' = "Marat's hair (tied)"; 'Marat_C' = "Marat's hair (loose)"
        'Mihai_A' = "Mihai's hair"; 'Vicho_A' = "Vicho's hair"
        'beard/Andrei_A' = "Andrei's beard"; 'beard/Commoner_A' = 'Villager beard A'; 'beard/Commoner_B' = 'Villager beard B'; 'beard/Commoner_C' = 'Villager beard C'; 'beard/Commoner_D' = 'Villager beard D'; 'beard/Commoner_E' = 'Villager beard E'
        'beard/Villager_A' = 'Villager beard (other)'; 'beard/Marat_A' = "Marat's beard"; 'beard/Neberu_A' = "Neberu's beard A"; 'beard/Neberu_A1' = "Neberu's beard A1"; 'beard/Pieter_A' = "Pieter's beard"
        'eyes/red' = 'Red'; 'eyes/blue' = 'Blue'; 'eyes/green' = 'Green'; 'eyes/yellow' = 'Yellow'; 'eyes/orange' = 'Orange'; 'eyes/purple' = 'Purple'
        'romance/undress' = 'Undress (scenes where vanilla shows underwear)'
        'coen_uw/off' = 'Off (also in normal scenes)'
        'body/masculine' = 'ELSB'; 'anca_body/booty' = 'ELSB'; 'lacra_body/fitness' = 'ELSB'
        'marat_body/fitness' = 'ELSB'; 'marat_romance/undress' = 'Undress (scenes where vanilla shows underwear)'
        'anca_scope/all' = 'All scenes'; 'lacra_scope/all' = 'All scenes'; 'marat_scope/all' = 'All scenes'
        'anca_hair/Anca_B' = "Anca's hair B (tied up)"; 'anca_hair/Esme_A' = "Esme's hair"; 'anca_hair/Yanna_H' = "Yanna's hair"; 'anca_hair/Commoner_C' = 'Village woman hair C'; 'anca_hair/Commoner_E' = 'Village woman hair E'; 'anca_hair/Villager_H' = 'Village woman hair H'
        'lacra_hair/Commoner_A' = 'Village woman hair A'; 'lacra_hair/Commoner_B' = 'Village woman hair B'; 'lacra_hair/Commoner_C' = 'Village woman hair C'; 'lacra_hair/Commoner_E' = 'Village woman hair E'; 'lacra_hair/Villager_H' = 'Village woman hair H'
        'lacra_hair/Esme_A' = "Esme's hair"; 'lacra_hair/Yanna_H' = "Yanna's hair"; 'lacra_hair/Sarah_A' = "Sarah's hair"; 'lacra_hair/XanthesDaughter_A' = "Xanthe's daughter's hair"
        'playas/anca_A' = 'Anca (usual outfit)'; 'playas/anca_naked' = 'Anca (naked)'; 'playas/lacra_A' = 'Lacra (usual outfit)'; 'playas/lacra_E' = 'Lacra (jacket B)'; 'playas/lacra_naked' = 'Lacra (naked)'
        'playas/marat_A' = 'Marat (usual outfit)'; 'playas/marat_C' = 'Marat (shirtless)'; 'playas/marat_D' = 'Marat (shirt)'; 'playas/marat_naked' = 'Marat (naked)'
        'anca_outfit/nude' = 'Naked'; 'lacra_outfit/nude' = 'Naked'; 'marat_outfit/nude' = 'Naked'
        'marat_hair/Ambrus_A' = "Ambrus's hair"; 'marat_hair/Commoner_B' = 'Villager hair B'; 'marat_hair/Commoner_D' = 'Villager hair D'; 'marat_hair/Commoner_F' = 'Villager hair F'; 'marat_hair/Isbrand_A' = "Isbrand's hair"; 'marat_hair/Mihai_A' = "Mihai's hair"
        'marat_beard/0_none' = 'None (clean-shaven)'; 'marat_beard/Andrei_A' = "Andrei's beard (light stubble)"; 'marat_beard/Commoner_A' = 'Villager beard A (light stubble)'; 'marat_beard/Commoner_B' = 'Villager beard B'; 'marat_beard/Commoner_C' = 'Villager beard C'; 'marat_beard/Commoner_D' = 'Villager beard D'; 'marat_beard/Commoner_E' = 'Villager beard E'
        'marat_beard/Villager_A' = 'Villager beard (other)'; 'marat_beard/Neberu_A' = "Neberu's beard A"; 'marat_beard/Neberu_A1' = "Neberu's beard A1"; 'marat_beard/Pieter_A' = "Pieter's beard"
        '01_black' = 'Black'; '02_darkbrown' = 'Dark brown'; '03_brown' = 'Brown'; '04_lightbrown' = 'Light brown'; '05_auburn' = 'Auburn'; '06_ginger' = 'Ginger'; '07_darkblonde' = 'Dark blonde'; '08_blonde' = 'Blonde'; '09_platinum' = 'Platinum blonde'; '10_saltpepper' = 'Salt and pepper'; '11_white' = 'White'
        'lacra_eyes/red' = 'Red'; 'lacra_eyes/blue' = 'Blue'; 'lacra_eyes/green' = 'Green'; 'lacra_eyes/yellow' = 'Yellow'; 'lacra_eyes/orange' = 'Orange'; 'lacra_eyes/purple' = 'Purple'
    }
}
# Personal optional body variants; upstream labels remain unchanged.
foreach ($language in @('ja','en')) {
    $NAMES[$language]['anca_body/booty_pussywalker'] = 'ELSB + Pussy Walker'
    $NAMES[$language]['lacra_body/fitness_pussywalker'] = 'ELSB + Pussy Walker'
}
# === LANG END ===
function Map-Lang($name) { if (-not $name) { return $null }; if (([string]$name).ToLowerInvariant().StartsWith('ja')) { return 'ja' }; return $null }
function Pick-StartLang($uiName, $culName) { foreach ($c in @((Map-Lang $uiName), (Map-Lang $culName))) { if ($c) { return $c } }; return 'en' }
$script:lang = Pick-StartLang $SYS_UI_CULTURE $SYS_CULTURE
function T($k) { $t = $UI[$script:lang]; if ($t -and $t.ContainsKey($k)) { return $t[$k] }; return $UI['en'][$k] }
function First-Label($kindKey) {
    # 先頭の選択肢 (何も置かない) の呼び名: 髭は「なし」、体の場面は「裸の場面だけ」、他は「バニラ」
    $kd = $KINDS | Where-Object { $_.key -eq $kindKey } | Select-Object -First 1
    if ($kd -and $kd.first) { return (T $kd.first) }
    return (T 'vanilla')
}
function Option-Name($kind, $folder) {
    # v1.1 (10-02 夜 本人「互換 MOD を読み込んだ場合、互換適応済などの分かりやすい表記を」): ELSB の体に合わせた版 (互換) のある MOD は「[MOD] 名前 (ELSB 対応)」
    if (([string]$folder).StartsWith('ext:')) { $nm = ([string]$folder).Substring(4); return ((T 'extModTag') + $nm + $(if (Test-ExtHasCompat $nm) { (T 'extCompatTag') } else { '' })) }
    if (([string]$folder).StartsWith('part:')) {
        # v1.1 (10-02): 互換の部分 = その互換の相手の MOD の名前で ([MOD] Coen Nude (ELSB 対応))
        foreach ($c in @(Get-CompatMods)) { foreach ($pt in @($c.parts)) { if ($pt.opt -eq [string]$folder) { $cs = Get-CompatSource $c; return ((T 'extModTag') + $(if ($cs) { [string]$cs.name } else { [string]$c.title }) + (T 'extCompatTag')) } } }
        return [string]$folder
    }
    $t = $NAMES[$script:lang]
    foreach ($k in @(($kind + '/' + $folder), $folder)) { if ($t.ContainsKey($k)) { return $t[$k] } }
    return $folder
}

# ---------------------------------------------------------------------------
#  設定ファイル
# ---------------------------------------------------------------------------
function Read-Ini {
    $d = @{}
    if (Test-Path -LiteralPath $INI_PATH) {
        foreach ($line in [IO.File]::ReadAllLines($INI_PATH, [Text.Encoding]::UTF8)) {
            $i = $line.IndexOf('='); if ($i -gt 0) { $d[$line.Substring(0, $i).Trim()] = $line.Substring($i + 1).Trim() }
        }
    }
    return $d
}
function Write-Ini($d) {
    $lines = @(); foreach ($k in ($d.Keys | Sort-Object)) { $lines += ($k + '=' + $d[$k]) }
    [IO.File]::WriteAllLines($INI_PATH, [string[]]$lines, (New-Object System.Text.UTF8Encoding($false)))
}

# ---------------------------------------------------------------------------
#  ゲームフォルダの検出 (Bloodywalker v1.2.1 と同じ)
# ---------------------------------------------------------------------------
function Get-RegValue($key, $name) {
    try { $v = (Get-ItemProperty -Path $key -Name $name -ErrorAction Stop).$name; if ($v) { return ([string]$v) } } catch { }
    return $null
}
function Expand-VdfPath($p) { $bs = [string][char]92; return ([string]$p).Replace($bs + $bs, $bs).TrimEnd($bs) }
function Find-AllInstalls {
    $bases = @(); $steamRoots = @()
    foreach ($k in 'HKCU:\Software\Valve\Steam', 'HKLM:\SOFTWARE\WOW6432Node\Valve\Steam', 'HKLM:\SOFTWARE\Valve\Steam') {
        foreach ($n in 'SteamPath', 'InstallPath') { $v = Get-RegValue $k $n; if ($v) { $steamRoots += (($v -replace '/', '\').TrimEnd('\')) } }
    }
    $steamRoots += "${env:ProgramFiles(x86)}\Steam"
    foreach ($sr in @($steamRoots | Select-Object -Unique)) {
        $bases += ($sr + "\steamapps\common\The Blood of Dawnwalker")
        $lf = $sr + "\steamapps\libraryfolders.vdf"; $ok = $false
        try { $ok = Test-Path -LiteralPath $lf } catch { $ok = $false }
        $vdf = $null
        if ($ok) { try { $vdf = [IO.File]::ReadAllText($lf, [Text.Encoding]::UTF8) } catch { $vdf = $null } }
        if ($vdf) { foreach ($m in ([regex]'"path"\s+"([^"]+)"').Matches($vdf)) { $bases += ((Expand-VdfPath $m.Groups[1].Value) + "\steamapps\common\The Blood of Dawnwalker") } }
    }
    $bases += "$env:ProgramFiles\GOG Galaxy\Games\The Blood of Dawnwalker"
    $bases += "${env:ProgramFiles(x86)}\GOG Galaxy\Games\The Blood of Dawnwalker"
    foreach ($gk in 'HKLM:\SOFTWARE\WOW6432Node\GOG.com\Games', 'HKLM:\SOFTWARE\GOG.com\Games') {
        try { foreach ($g in (Get-ChildItem -Path $gk -ErrorAction Stop)) { $p = (Get-ItemProperty -Path $g.PSPath -ErrorAction SilentlyContinue).path; if ($p) { $bases += [string]$p } } } catch { }
    }
    $d = $PSScriptRoot
    for ($i = 0; $i -lt 6 -and $d; $i++) { $bases += $d; $d = Split-Path -Parent $d }
    $found = @(); $seen = @{}
    foreach ($b in $bases) {
        if (-not $b) { continue }
        $r = ([string]$b).TrimEnd('\'); $exe = $r + "\Dawnwalker\Binaries\Win64\Dawnwalker.exe"; $hit = $false
        try { $hit = Test-Path -LiteralPath $exe } catch { $hit = $false }
        if ($hit) { $k = $r.ToLowerInvariant(); if (-not $seen.ContainsKey($k)) { $seen[$k] = $true; $found += $r } }
    }
    return $found
}
function Resolve-GameRoot($p) {
    if (-not $p) { return $null }
    $d = ([string]$p).TrimEnd('\')
    for ($i = 0; $i -lt 6 -and $d; $i++) {
        $hit = $false
        try { $hit = Test-Path -LiteralPath ($d + '\Dawnwalker\Binaries\Win64\Dawnwalker.exe') } catch { $hit = $false }
        if ($hit) { return $d }
        try { $d = Split-Path -Parent $d } catch { $d = $null }
    }
    return $null
}
function Get-PaksDir($root) { return (Join-Path $root $PAKS_REL) }
function Test-GameRunning { try { return ((@(Get-Process -Name 'Dawnwalker' -ErrorAction SilentlyContinue)).Count -gt 0) } catch { return $false } }
# この道具がゲームの Paks フォルダの中に置かれていないか (中の箱が全部読み込まれてゲームが壊れる。BoDQS v1.8.1 と同じ考え)
function Test-InsidePaks { return (([string]$PSScriptRoot).ToLowerInvariant() -match '\\dawnwalker\\content\\paks(\\|$)') }

# ---------------------------------------------------------------------------
#  箱 (utoc) の中身の一覧 (ファイル名だけ読む。競合の判定用)
# ---------------------------------------------------------------------------
function Read-FString($b, [ref]$p) {
    $len = [BitConverter]::ToInt32($b, $p.Value); $p.Value += 4
    if ($len -eq 0) { return '' }
    if ($len -gt 0) { $s = [Text.Encoding]::ASCII.GetString($b, $p.Value, $len - 1); $p.Value += $len; return $s }
    $n = -$len; $s = [Text.Encoding]::Unicode.GetString($b, $p.Value, ($n - 1) * 2); $p.Value += $n * 2; return $s
}
function Read-UtocFiles($utoc) {
    # 返り値: 箱の中のファイルのパス (小文字) の配列。読めない (暗号化など) ときは $null
    $out = @()
    try {
        $f = [IO.File]::ReadAllBytes($utoc)
        if ($f.Length -lt 144) { return $null }
        $ver = $f[16]; $hdrSize = [BitConverter]::ToUInt32($f, 20); $entryCnt = [BitConverter]::ToUInt32($f, 24); $blkCnt = [BitConverter]::ToUInt32($f, 28)
        $cmNameCnt = [BitConverter]::ToUInt32($f, 36); $cmNameLen = [BitConverter]::ToUInt32($f, 40); $dirSize = [BitConverter]::ToUInt32($f, 48)
        $flags = $f[80]; $phSeeds = [BitConverter]::ToUInt32($f, 84); $noPh = [BitConverter]::ToUInt32($f, 96)
        if (($flags -band 2) -ne 0) { return $null }                                   # 暗号化された箱は読まない
        [long]$off = $hdrSize
        $off += [long]$entryCnt * 12; $off += [long]$entryCnt * 10
        if ($ver -ge 4) { $off += [long]$phSeeds * 4 }
        if ($ver -ge 5) { $off += [long]$noPh * 4 }
        $off += [long]$blkCnt * 12; $off += [long]$cmNameCnt * $cmNameLen
        if (($flags -band 4) -ne 0) { $sig = [BitConverter]::ToInt32($f, [int]$off); $off += 4 + $sig * 2 + 20 }
        if ($off + $dirSize -gt $f.Length -or $dirSize -lt 8) { return $null }
        $dir = New-Object byte[] $dirSize; [Array]::Copy($f, $off, $dir, 0, $dirSize)
        $p = 0
        $mount = Read-FString $dir ([ref]$p)
        $dirCnt = [BitConverter]::ToInt32($dir, $p); $p += 4
        $dirs = New-Object object[] $dirCnt
        for ($i = 0; $i -lt $dirCnt; $i++) { $dirs[$i] = @([BitConverter]::ToUInt32($dir, $p), [BitConverter]::ToUInt32($dir, $p + 4), [BitConverter]::ToUInt32($dir, $p + 8), [BitConverter]::ToUInt32($dir, $p + 12)); $p += 16 }
        $fileCnt = [BitConverter]::ToInt32($dir, $p); $p += 4
        $files = New-Object object[] $fileCnt
        for ($i = 0; $i -lt $fileCnt; $i++) { $files[$i] = @([BitConverter]::ToUInt32($dir, $p), [BitConverter]::ToUInt32($dir, $p + 4)); $p += 12 }
        $strCnt = [BitConverter]::ToInt32($dir, $p); $p += 4
        $strs = New-Object string[] $strCnt
        for ($i = 0; $i -lt $strCnt; $i++) { $strs[$i] = Read-FString $dir ([ref]$p) }
        $NONE = [uint32]4294967295
        $stack = New-Object System.Collections.Stack
        $stack.Push(@([uint32]0, [string]$mount))
        while ($stack.Count -gt 0) {
            $it = $stack.Pop(); $di = [uint32]$it[0]; $prefix = [string]$it[1]
            if ($di -eq $NONE -or $di -ge $dirs.Length) { continue }
            $d = $dirs[$di]
            $here = $prefix; if ($d[0] -ne $NONE) { $here = $prefix + $strs[$d[0]] + '/' }
            $fi = [uint32]$d[3]
            while ($fi -ne $NONE -and $fi -lt $files.Length) { $out += ($here + $strs[$files[$fi][0]]).ToLowerInvariant(); $fi = [uint32]$files[$fi][1] }
            $c = [uint32]$d[1]
            while ($c -ne $NONE -and $c -lt $dirs.Length) { $stack.Push(@($c, $here)); $c = [uint32]$dirs[$c][2] }
        }
    } catch { return $null }
    return $out
}
$script:assetCache = @{}
function Get-BoxAssets($utoc) {
    if (-not $script:assetCache.ContainsKey($utoc)) { $script:assetCache[$utoc] = (Read-UtocFiles $utoc) }
    return $script:assetCache[$utoc]
}

# ---------------------------------------------------------------------------
#  箱の置き換え
# ---------------------------------------------------------------------------
$script:dirCache = @{}      # modules の中のフォルダの一覧 (箱の 3 つ組・子フォルダ)。読み直す・取り込むときに捨てる (~mods は控えない)
$script:optCache = @{}
function Reset-DirCache { $script:dirCache = @{}; $script:optCache = @{}; $script:modFp = $null; $script:kindSig = $null; $script:equiv = $null; $script:compatCache = $null; $script:compatSrc = @{}; $script:coreSig = $null }
function Get-DirInfo($dir) {
    # 返り値: @{ triples = 3 つ組 (.pak/.ucas/.utoc) のそろった箱の名前 (名前順); subs = 子フォルダのフルパス (名前順) }
    $key = ([string]$dir).ToLowerInvariant()
    $keep = $key.StartsWith(([string]$MOD_DIR).ToLowerInvariant())
    if ($keep -and $script:dirCache.ContainsKey($key)) { return $script:dirCache[$key] }
    $tri = @(); $subs = @()
    if ($dir -and [IO.Directory]::Exists($dir)) {
        $names = @{}
        foreach ($f in [IO.Directory]::GetFiles($dir)) { $names[[IO.Path]::GetFileName($f).ToLowerInvariant()] = $true }
        foreach ($f in @([IO.Directory]::GetFiles($dir, '*.ucas') | Sort-Object)) {
            $n = [IO.Path]::GetFileNameWithoutExtension($f)
            if ($names.ContainsKey(($n + '.utoc').ToLowerInvariant()) -and $names.ContainsKey(($n + '.pak').ToLowerInvariant())) { $tri += $n }
        }
        $subs = @([IO.Directory]::GetDirectories($dir) | Sort-Object)
    }
    $r = @{ triples = $tri; subs = $subs }
    if ($keep) { $script:dirCache[$key] = $r }
    return $r
}
function Get-KindBoxes($kind, $dir) {
    # $dir の中の、この種類の箱 (<種類の名前>*_P の 3 つ組) の名前。1 つの選択肢に複数の箱 (網目と肌 + BDP) を入れられる (v0.5)
    $out = @()
    if (-not $dir) { return $out }
    $base = ($kind.box -replace '_P$', '')
    $re = '^' + [regex]::Escape($base) + '[A-Za-z0-9]*_P$'
    $reOld = '^' + [regex]::Escape($OLD_BOX_PREFIX + $base.Substring($BOX_PREFIX.Length)) + '[A-Za-z0-9]*_P$'      # v1.0.1: v1.0 までの名前の箱も同じ種類
    foreach ($n in @((Get-DirInfo $dir).triples)) { if ($n -cmatch $re -or $n -cmatch $reOld) { $out += $n } }
    return $out
}
function Get-Options($kind) {
    if ($script:optCache.ContainsKey($kind.key)) { return $script:optCache[$kind.key] }
    $out = @()
    $d = Join-Path $MOD_DIR $kind.dir
    foreach ($full in @((Get-DirInfo $d).subs)) {
        $name = [IO.Path]::GetFileName($full)
        if ($name.StartsWith('_')) { continue }     # _default = 先頭の選択肢 (空) のときに置く箱 (選択肢には出さない)
        if (Get-OptionPair $kind $name) {
            # 組み合わせで分かれる選択肢: 選択肢の中の <組み合わせる項目の選択肢 | _vanilla> のどれかに箱があれば選択肢
            if (@(Get-PairDirs $kind $name | Where-Object { @(Get-KindBoxes $kind $_).Count -gt 0 }).Count -gt 0) { $out += $name }
            continue
        }
        if (@(Get-KindBoxes $kind $full).Count -gt 0) { $out += $name }
    }
    $script:optCache[$kind.key] = $out
    return $out
}
function Get-OptionDir($kind, $o) { return (Join-Path (Join-Path $MOD_DIR $kind.dir) $o) }
function Get-OptionPair($kind, $o) {
    # この選択肢の箱が、ほかの項目の選択で分かれるなら、その項目の key。pair = 項目の全選択肢 (マラトの髭の色)、
    #   pairBy = 名前の頭が合う選択肢で、フォルダの中に <その項目の選択肢 | _vanilla> のフォルダがある物だけ (操作キャラのマラト → マラトの服)
    if ($kind.pair) { return [string]$kind.pair }
    if ($kind.pairBy) {
        foreach ($pre in $kind.pairBy.Keys) {
            if (([string]$o).StartsWith($pre) -and @((Get-DirInfo (Get-OptionDir $kind $o)).subs).Count -gt 0) { return [string]$kind.pairBy[$pre] }
        }
    }
    return ''
}
function Get-PairDirs($kind, $o) {
    # pair の項目の、選択肢の中の場所 (<pair の選択肢 | _vanilla>) を全部
    return @((Get-DirInfo (Get-OptionDir $kind $o)).subs)
}
function Get-PussyWalkerSource($kind, $o, $sel) {
    $character = switch ($kind.key) {
        'anca_scope' { 'anca' }; 'anca_outfit' { 'anca' }
        'lacra_scope' { 'lacra' }; 'lacra_outfit' { 'lacra' }
        default { '' }
    }
    if (-not $character) { return '' }
    $variant = if ($character -eq 'anca') { 'booty_pussywalker' } else { 'fitness_pussywalker' }
    if ([string]$sel[($character + '_body')] -ne $variant) { return '' }
    if (($kind.key.EndsWith('_scope') -and $o -eq 'all') -or ($kind.key.EndsWith('_outfit') -and $o -eq 'nude')) {
        return (Join-Path (Join-Path (Join-Path $MOD_DIR '_pussywalker') $kind.dir) $o)
    }
    return ''
}
function Get-SourceDir($kind, $o, $sel) {
    $variantSource = Get-PussyWalkerSource $kind $o $sel
    if ($variantSource) { return $variantSource }
    # 置く箱のある場所。組み合わせで分かれる選択肢は、組み合わせる項目の選択で分ける (選んでいない・他の MOD のときは _vanilla)
    #   pairBy の選択肢は、その選択のフォルダが無ければ _vanilla (pair の項目は箱なし = 置かない、マラトの髭なし)
    $d = Get-OptionDir $kind $o
    $pk = Get-OptionPair $kind $o
    if (-not $pk) { return $d }
    $p = [string]$sel[$pk]
    if (-not $p -or $p.StartsWith('ext:')) { $p = '_vanilla' }
    # v0.14.6: 組み合わせる項目が needs で置かれないとき (体型がバニラで「全部の場面」) は _vanilla (操作キャラのラクラが、置かれない肌着の写しを指さないように)
    $pkind = @($KINDS | Where-Object { $_.key -eq $pk }) | Select-Object -First 1
    if ($pkind -and -not (Test-NeedsMet $pkind $sel)) { $p = '_vanilla' }
    if (-not $kind.pair -and -not (Test-Path -LiteralPath (Join-Path $d $p))) { $p = '_vanilla' }
    return (Join-Path $d $p)
}
$HASH_PATH = Join-Path $PSScriptRoot 'ELSB.hashes'
$OLD_HASH  = Join-Path $PSScriptRoot 'Goldwalker.hashes'
if (-not $Plan -and -not $LibraryOnly -and -not (Test-Path -LiteralPath $HASH_PATH) -and (Test-Path -LiteralPath $OLD_HASH)) { try { Copy-Item -LiteralPath $OLD_HASH -Destination $HASH_PATH } catch { } }
$script:hashMemo = $null
function Get-FileHash256($p) {
    # 箱の中身の目印 (SHA256)。名前・大きさ・更新日時が同じファイルは同じ中身とみなし、覚えた値を使う (v0.9.1: 1 GB を超える箱を
    #   起動・適用のたびに modules と ~mods の両方で読み直していた)。Copy-Item は更新日時を保つので、~mods の写しは元の箱と同じ鍵になる。
    #   覚えた値は Goldwalker.hashes に足していく (読めない・書けないときは覚えずに計算するだけ)
    if ($null -eq $script:hashMemo) {
        $script:hashMemo = @{}
        try { if (Test-Path -LiteralPath $HASH_PATH) { foreach ($l in [IO.File]::ReadAllLines($HASH_PATH)) { $i = $l.LastIndexOf('|'); if ($i -gt 0) { $script:hashMemo[$l.Substring(0, $i)] = $l.Substring($i + 1) } } } } catch { }
    }
    $fi = Get-Item -LiteralPath $p
    $key = $fi.Name + '|' + $fi.Length + '|' + $fi.LastWriteTimeUtc.Ticks
    if ($script:hashMemo.ContainsKey($key)) { return $script:hashMemo[$key] }
    $h = (Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash
    $script:hashMemo[$key] = $h
    try { [IO.File]::AppendAllText($HASH_PATH, ($key + '|' + $h + "`r`n")) } catch { }
    return $h
}
$EQUIV_PATH = Join-Path $MOD_DIR '_equiv.txt'     # 同じ中身で形だけ違う箱の対応 (前の .ucas の SHA256|今の SHA256)。compress_modules.py が書く
$script:equiv = $null
function Get-Equiv {
    if ($null -ne $script:equiv) { return $script:equiv }
    $script:equiv = @{}
    try { if (Test-Path -LiteralPath $EQUIV_PATH) { foreach ($l in [IO.File]::ReadAllLines($EQUIV_PATH)) { $i = $l.IndexOf('|'); if ($i -gt 0) { $script:equiv[$l.Substring(0, $i).Trim().ToUpperInvariant()] = $l.Substring($i + 1).Trim().ToUpperInvariant() } } } } catch { }
    return $script:equiv
}
function Get-BoxSet($kind, $dir) {
    # 箱の組の目印: 「名前=.ucas の SHA256」を並べた文字列 ('' なら箱なし)。modules の箱を圧縮し直す前の形の箱は、対応表で今の SHA256 に読み替える
    $eq = Get-Equiv
    $parts = @()
    foreach ($b in @(Get-KindBoxes $kind $dir)) {
        $h = [string](Get-FileHash256 (Join-Path $dir ($b + '.ucas'))); $hu = $h.ToUpperInvariant()
        if ($eq.ContainsKey($hu)) { $h = $eq[$hu] }
        $parts += ((Get-NewBoxName $b) + '=' + $h.ToUpperInvariant())      # v1.0.1: 前の名前の箱は新しい名前で比べる
    }
    return ((@($parts) | Sort-Object) -join ';')
}
function Get-Installed($root, $prefer = $null) {
    # 種類ごとに今 ~mods に入っている物: 選択肢の名前 / 'ext:<MOD名>' / '?' (知らない箱) / '' (無し)
    #   $prefer = 選んでいた物 (key → 選択肢)。同じ中身の箱を持つ選択肢が複数あるとき (操作キャラのマラト A・C・D の裸) はそちらを答える
    $paks = Get-PaksDir $root; $out = @{}
    $exts = @(Get-ExtMods)
    foreach ($kind in $KINDS) {
        $out[$kind.key] = ''
        $have = Get-BoxSet $kind $paks
        if ($have) {
            $out[$kind.key] = '?'
            if ((Get-BoxSet $kind (Get-OptionDir $kind '_default')) -eq $have) { $out[$kind.key] = ''; continue }
            $pv = $(if ($prefer) { [string]$prefer[$kind.key] } else { '' })
            $first = ''
            foreach ($o in (Get-Options $kind)) {
                $dirs = $(if (Get-OptionPair $kind $o) { @(Get-PairDirs $kind $o) } else { @(Get-OptionDir $kind $o) })
                $pwDir = Get-PussyWalkerSource $kind $o $(if ($prefer) { $prefer } else { $out })
                if ($pwDir) { $dirs += $pwDir }
                $hit = $false; foreach ($dd in $dirs) { if ((Get-BoxSet $kind $dd) -eq $have) { $hit = $true; break } }
                if (-not $hit) { continue }
                if (-not $first) { $first = $o }
                if (-not $pv -or $o -eq $pv) { $first = $o; break }
            }
            if ($first) { $out[$kind.key] = $first }
            continue
        }
        if ($kind.partItem) {
            # v1.1 (10-02): 互換の部分の箱が入っていれば、その部分の選択肢
            foreach ($c in @(Get-CompatMods)) { foreach ($pt in @($c.parts)) { if ($pt.item -eq $kind.key -and (Test-Path -LiteralPath (Join-Path $paks ($pt.box + '.ucas')))) { $out[$kind.key] = $pt.opt } } }
            continue
        }
        foreach ($e in $exts) {
            if ($e.kinds -notcontains $kind.key -and $e.main -ne $kind.key) { continue }      # v1.1 (10-02): anyExt の項目 (性器) は重ならないので main で
            if ($e.main -and $e.main -ne $kind.key -and $KIND_BY_KEY[[string]$e.main].overlay) { continue }      # v1.1 (10-02 分家): 肌の項目の MOD は重なる項目 (体型) の物ではない
            $all = $true; foreach ($b in $e.boxes) { if (-not (Test-ExtBoxPlaced $paks $b)) { $all = $false } }
            if ($all) { $out[$kind.key] = 'ext:' + $e.name; break }
        }
    }
    return $out
}
function Remove-Box($paks, $name) {
    Assert-ManualPath $paks
    foreach ($x in '.pak', '.ucas', '.utoc') { $p = Join-Path $paks ($name + $x); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
}
function Remove-KindBoxes($paks, $kind, $keep) {
    # ~mods の中のこの種類の箱を外す (選択肢によって箱の数が違うので、名前の形で探す)。$keep = これから置く箱の名前 (外さず Place-Box に任せる)
    $k = @($keep | Where-Object { $_ })
    if ($k -notcontains $kind.box) { Remove-Box $paks $kind.box }
    foreach ($b in @(Get-KindBoxes $kind $paks)) { if ($k -notcontains $b) { Remove-Box $paks $b } }
}
function Test-SameFile($a, $b) {
    if (-not (Test-Path -LiteralPath $b)) { return $false }
    $x = Get-Item -LiteralPath $a; $y = Get-Item -LiteralPath $b
    return ($x.Length -eq $y.Length -and $x.LastWriteTimeUtc -eq $y.LastWriteTimeUtc)
}
$OVL_PREFIX = '0ELSB_Skin_'      # v1.1 (10-02 分家): 肌の項目 (overlay) の MOD の箱が名前の順で ELSB_ に負けるとき、~mods にはこの頭を付けて置く
function Get-ExtPlaceName($e, $b) {
    # 取り込んだ MOD $e の箱 $b を ~mods に置く名前。肌の項目の MOD で、名前が ELSB_ より先でなければ頭に $OVL_PREFIX (ゲームは名前の小さい箱が勝つ)
    #   10-02 夜 (本家): 大文字・小文字を区別しても・しなくても先の名前だけそのまま (小文字の djrd_ は区別すると大文字の ELSB_ より後になり、タトゥの画像 2 枚が出ない恐れ)
    $mk = $(if ($e.main) { $KIND_BY_KEY[[string]$e.main] } else { $null })
    if ($mk -and $mk.overlay) {
        $first = ([string]::CompareOrdinal([string]$b, $BOX_PREFIX) -lt 0) -and ([string]::CompareOrdinal(([string]$b).ToLowerInvariant(), $BOX_PREFIX.ToLowerInvariant()) -lt 0)
        if (-not $first) { return ($OVL_PREFIX + [string]$b) }
    }
    return [string]$b
}
function Get-ExtBoxVariants($b) { return @([string]$b, ($OVL_PREFIX + [string]$b)) }      # ~mods にあり得る名前 (外すとき・置いたかを見るときは両方)
function Test-ExtBoxPlaced($paks, $b) { foreach ($v in @(Get-ExtBoxVariants $b)) { if (Test-Path -LiteralPath (Join-Path $paks ($v + '.ucas'))) { return $true } }; return $false }
function Place-BoxAs($srcDir, $name, $paks, $dstName) {
    Assert-ManualPath $paks
    # Place-Box と同じ (名前だけ替えて写す。3 つ組の中身はそのまま)
    foreach ($x in '.pak', '.ucas', '.utoc') {
        $s = Join-Path $srcDir ($name + $x); $d = Join-Path $paks ($dstName + $x)
        if (-not (Test-SameFile $s $d)) { Copy-Item -LiteralPath $s -Destination $d -Force }
    }
}
function Place-Box($srcDir, $name, $paks) {
    Assert-ManualPath $paks
    # 箱 (3 つ組) を ~mods に写す。同じ物 (大きさと更新日時が同じ) が既に置かれていれば写し直さない (v0.9.1: 毎回 1.5 GB を消して写していた)
    foreach ($x in '.pak', '.ucas', '.utoc') {
        $s = Join-Path $srcDir ($name + $x); $d = Join-Path $paks ($name + $x)
        if (-not (Test-SameFile $s $d)) { Copy-Item -LiteralPath $s -Destination $d -Force }
    }
}
# ---- 他の MOD: modules\external\<名前>\ に箱 (3 つ組) を置く。箱の中身 (ファイル名) から該当する項目を判定する ----
#   判定 = Goldwalker の同じ項目の箱と同じアセットを持つ (上書きし合う) か、項目ごとの目印 (パスの一部、小文字) を含む。どれにも該当しない箱は取り込まない
$KIND_PATTERNS = @{
    body    = @('hma_coen_body', 'hma_coen_legs_x', 'hma_coen_torso_bodypaint')
    hair    = @('/haircuts/hmface_', 'coen_haircuts', 'dt_garments')
    beard   = @('/hair/beards/')
    eyes    = @('coen_eyeball')
    romance = @('_app_human_coen', '_app_vampire_coen')
    coen_uw = @()
    anca_body     = @('bdp_hfa_anca_', 'hfa_anca_bodytorso', 'hfa_ancaxx_')
    lacra_body    = @('bdp_hfa_lacra_', 'hfa_lacra_bodytorso', 'hfa_lacrax_', 'hfa_lacrx_')
    marat_body    = @('bdp_hma_marat_', 'hma_marat_bodytorso', 'hma_maratx_')
    marat_romance = @('app_hma_marat_e_naked')
    anca_hair     = @('hfface_anca_haircuts_a/ca_hfface_anca_haircuts_a')
    lacra_hair    = @('hfface_lacra_haircuts_a/sk_hfface_lacra_haircuts_a')
    lacra_eyes    = @('hfa_lacra_head_b/materials/mi_hfa_lacra_eyeball')
    marat_hair    = @('hmface_marat_haircuts_a/ca_hmface_marat_haircuts_a.', 'hmface_marat_haircuts_b/ca_hmface_marat_haircuts_b.', 'hmface_marat_haircuts_c/sk_hmface_marat_haircuts_c.')
    hair_color    = @()
    beard_color   = @()
    anca_hair_color = @()
    lacra_hair_color = @()
    marat_hair_color = @()
    marat_beard_color = @()
    marat_beard   = @('hmface_marat_beards_a/sk_hmface_marat_beards_a.', 'hmface_marat_beards_a/materials/mi_hmface_marat_beard_a_01.', 'hmface_marat_beards_a/materials/mi_hmface_marat_beard_a_01_v2.')
    playas        = @('/appearance/player/appearance/')
    # 服: 見た目 (APP) を差し替える MOD (服を外す・替える)。体の場面は Goldwalker の箱と同じアセットのときだけ (目印なし)
    #   v0.14.2: その人専用の服の網目・布 (Garments の HFA_Anca_* など) を替える MOD も服に (Revealing Anca / Lacra が「体の場面」に並んでいた)
    anca_outfit   = @('app_anca_', '/hfa_anca_torso_', '/hfa_anca_legs_', '/hfa_anca_feet_', '/hfa_anca_wristgear_')
    lacra_outfit  = @('app_hfa_lacra_', '/hfa_lacra_torso_', '/hfa_lacra_legs_', '/hfa_lacra_feet_', '/hfa_lacra_headgear_')
    marat_outfit  = @('app_hma_marat_a_', 'app_hma_marat_b_', 'app_hma_marat_c_', 'app_hma_marat_d_', '/hma_marat_torso_', '/hma_marat_legs_', '/hma_marat_feet_')
    anca_scope    = @()
    lacra_scope   = @()
    marat_scope   = @()
}
$script:kindSig = $null
function Get-KindSignature {
    # 種類ごとに、Goldwalker の全選択肢の箱に入っているアセットのパス (小文字) の集合
    if ($script:kindSig) { return $script:kindSig }
    $sig = @{}
    foreach ($kind in $KINDS) {
        $h = @{}
        foreach ($o in (Get-Options $kind)) {
            $ods = $(if (Get-OptionPair $kind $o) { @(Get-PairDirs $kind $o) } else { @(Get-OptionDir $kind $o) })
            foreach ($od in $ods) {
                foreach ($b in @(Get-KindBoxes $kind $od)) {
                    $a = Get-BoxAssets (Join-Path $od ($b + '.utoc'))
                    if ($a) { foreach ($x in $a) { $h[([string]$x).ToLowerInvariant()] = $true } }
                }
            }
        }
        $sig[$kind.key] = $h
    }
    $script:kindSig = $sig
    return $sig
}
function Get-BoxKinds($utoc) {
    # 箱が該当する項目 (key の配列)。中身が読めない箱 (暗号化など) は該当なし
    $a = Get-BoxAssets $utoc
    if (-not $a) { return @() }
    $sig = Get-KindSignature; $out = @()
    foreach ($kind in $KINDS) {
        $hit = $false
        foreach ($x in $a) {
            $xl = ([string]$x).ToLowerInvariant()
            if ($sig[$kind.key].ContainsKey($xl)) { $hit = $true; break }
            foreach ($pt in $KIND_PATTERNS[$kind.key]) { if ($xl.Contains($pt)) { $hit = $true; break } }
            if ($hit) { break }
        }
        if ($hit) { $out += $kind.key }
    }
    return $out
}
function Get-BoxKindScores($utoc) {
    # 箱が該当する項目と、該当するファイルの数 (key → 数)
    $out = @{}
    $a = Get-BoxAssets $utoc
    if (-not $a) { return $out }
    $sig = Get-KindSignature
    foreach ($kind in $KINDS) {
        $n = 0
        foreach ($x in $a) {
            $xl = ([string]$x).ToLowerInvariant(); $hit = $sig[$kind.key].ContainsKey($xl)
            if (-not $hit) { foreach ($pt in @($KIND_PATTERNS[$kind.key])) { if ($pt -and $xl.Contains($pt)) { $hit = $true; break } } }
            if ($hit) { $n++ }
        }
        if ($n -gt 0) { $out[$kind.key] = $n }
    }
    return $out
}
$FROM_MODS_FILE = 'elsb_from_mods.txt'      # v1.1.1: ~mods から「取り込む」で取り込んだ MOD の印 (一覧から消すとき ~mods のファイルを消さない)
$MAIN_FILE = 'elsb_item.txt'      # 取り込んだ MOD のフォルダの中: 選ぶ項目 (本人が決めた物。'none' = 項目なし)
# v0.14.3: MOD の名前 (フォルダ名と箱の名前) の手がかり。上から順に、名前に合って、しかもファイルが重なる項目があれば、その中から選ぶ
#   (重なるファイルの数だけでは、髭の MOD が髪型に、色の MOD が髪型に並ぶなど外れるため)。同じ数なら keys の順
#   下着・裸はロマンスを先に (Coen の Underwear Remover が替えるのはロマンスの場面の APP 4 つだけ)
$NAME_HINTS = @(
    @{ re = 'play ?as'; keys = @('playas') }
    @{ re = 'underwear|undies|panties|nude|naked|undress'; keys = @('romance', 'marat_romance', 'coen_uw', 'anca_outfit', 'lacra_outfit', 'marat_outfit') }
    @{ re = 'beard|moustache|mustache|goatee|stubble'; keys = @('beard', 'marat_beard') }
    @{ re = 'colou?r|dye'; keys = @('hair_color', 'beard_color', 'anca_hair_color', 'lacra_hair_color', 'marat_hair_color', 'marat_beard_color') }
    @{ re = 'eye'; keys = @('eyes', 'lacra_eyes') }
    @{ re = 'hair'; keys = @('hair', 'anca_hair', 'lacra_hair', 'marat_hair') }
    @{ re = 'outfit|cloth|dress|reveal|armou?r|costume|garment'; keys = @('anca_outfit', 'lacra_outfit', 'marat_outfit') }
    @{ re = 'body|thicc|curv|muscul|busty|figure'; keys = @('body', 'anca_body', 'lacra_body', 'marat_body') }
)
function Get-NameHintText($dir) {
    # 名前の手がかりに使う文字 (小文字): 取り込んだ名前 + 箱の名前
    $t = [string](Split-Path -Leaf $dir)
    try { foreach ($u in @(Get-ChildItem -LiteralPath $dir -Filter '*.utoc' -File -ErrorAction SilentlyContinue)) { $t += ' ' + [IO.Path]::GetFileNameWithoutExtension($u.Name) } } catch { }
    return $t.ToLowerInvariant()
}
$SKIN_WHO = @(@{ key = 'skin'; re = 'hma_coen' }, @{ key = 'anca_skin'; re = 'anca' }, @{ key = 'lacra_skin'; re = 'lacra|lacrx' }, @{ key = 'marat_skin'; re = 'marat' })
function Get-SkinSlot($dir) {
    # v1.1 (10-02 分家): 取り込んだ MOD の中身が全部「人物の頭・体の画像のフォルダ (…/Textures/) の物」なら、その人物の肌の項目の key。違えば ''
    #   髪・髭・目・眉・歯は除く (髪の色や目の色の MOD は今までどおり)。網目・表・見た目 (APP/BDP) を含む MOD は対象外 (体型の MOD など)
    #   例: Tattoos of the Dawnwalker (Djrd Coen Tats) = コーエンの頭・胴・手の画像 21 個 (うち 2 枚が ELSB の体型の箱と重なる)
    $assets = @()
    foreach ($u in @(Get-ChildItem -LiteralPath $dir -Filter '*.utoc' -File -ErrorAction SilentlyContinue)) { $assets += @(Get-BoxAssets $u.FullName) }
    if ($assets.Count -eq 0) { return '' }
    $cnt = @{}
    foreach ($a in $assets) {
        $p = ([string]$a).ToLowerInvariant().Replace('\', '/')
        if ($p -notmatch '/characters/(heads|humans/bodies)/' -or $p -notmatch '/textures/') { return '' }
        if ($p -match 'hair|beard|eyeball|eyebrow|eyelash|teeth') { return '' }
        foreach ($w in $SKIN_WHO) { if ($p -match $w.re) { $cnt[$w.key] = [int]$cnt[$w.key] + 1 } }
    }
    $best = ''; $bn = 0
    foreach ($w in $SKIN_WHO) { if ([int]$cnt[$w.key] -gt $bn -and $KIND_BY_KEY.ContainsKey($w.key)) { $best = $w.key; $bn = [int]$cnt[$w.key] } }
    return $best
}
function Get-ExtMain($dir, $ks, $score) {
    # 取り込んだ MOD を選ぶ項目 (1 つ)。本人が決めた物が先。次に互換の相手なら互換が働く項目 (v1.1)、名前の手がかり ($NAME_HINTS)。無ければ重なるファイルが一番多い項目
    #   (体の場面・検証用の項目は、ほかに無いときだけ。同じ数なら KINDS の順)。項目に当たらなければ '' (有効・無効だけ)
    $f = Join-Path $dir $MAIN_FILE
    if (Test-Path -LiteralPath $f) {
        $v = ''; try { $v = ([IO.File]::ReadAllText($f)).Trim() } catch { $v = '' }
        if ($v -eq 'none') { return '' }
        if ($ks -contains $v) { return $v }
        if ($v -and $KIND_BY_KEY.ContainsKey($v) -and $KIND_BY_KEY[$v].anyExt) { return $v }      # v1.1 (10-02): 性器など、重ならなくても選べる項目
    }
    $ci = Get-CompatSourceItem $dir      # v1.1 (10-02): 互換の相手なら、互換が働く項目 (manifest の source.item)。本人の elsb_item.txt の次
    if ($ci -and (($ks -contains $ci) -or $KIND_BY_KEY[$ci].anyExt)) { return $ci }
    # v1.1 (10-02 分家): 肌・メイク・タトゥの MOD (人物の肌の画像だけ) は、その人物の肌の項目 (体型を置き換えない)。
    #   順は 本人の elsb_item.txt → 互換の source.item (manifest の明示) → 肌の見立て → 名前の手がかり → 重なりの数 (本家と決めた)
    $sk = Get-SkinSlot $dir
    if ($sk) { return $sk }
    if (@($ks).Count -gt 1) {
        $hint = Get-NameHintText $dir
        foreach ($h in $NAME_HINTS) {
            if ($hint -notmatch $h.re) { continue }
            $hb = ''; $hn = 0
            foreach ($k in $h.keys) { if (($ks -contains $k) -and [int]$score[$k] -gt $hn) { $hb = $k; $hn = [int]$score[$k] } }
            if ($hb) { return $hb }
        }
    }
    $best = ''; $bn = 0
    foreach ($pass in 1, 2) {
        foreach ($k in $ks) {
            $kd = $KIND_BY_KEY[$k]
            if ($pass -eq 1 -and ($kd.needs -or $kd.devOnly)) { continue }
            if ([int]$score[$k] -gt $bn) { $best = $k; $bn = [int]$score[$k] }
        }
        if ($best) { break }
    }
    return $best
}
function Get-ExtItemChoices($e) {
    # v1.1 (10-02): MOD 管理の「選ぶ項目」に出す項目 = 重なる項目 + anyExt の項目 (性器)
    $out = @($e.kinds); foreach ($kd in $KINDS) { if ($kd.anyExt -and $out -notcontains $kd.key) { $out += $kd.key } }
    return $out
}
function Set-ExtMain($e, $k) { [IO.File]::WriteAllText((Join-Path $e.dir $MAIN_FILE), $(if ($k) { [string]$k } else { 'none' })) }
$script:extModsCache = $null
function Reset-ExtCache { $script:extModsCache = $null; $script:compatSrc = @{} }
$SCORE_FILE = 'elsb_scores.txt'      # 取り込んだ MOD のフォルダの中: 項目ごとに重なるファイルの数の控え (版・modules・その箱が同じ間は目次を読み直さない)
$script:modFp = $null
function Get-ModulesFingerprint {
    # modules の箱の目次 (.utoc) の場所・大きさ・日時をまとめた目印 (選択肢が増えた・替わったら変わる。取り込んだ MOD は含めない)
    if ($script:modFp) { return $script:modFp }
    $sb = New-Object System.Text.StringBuilder
    if ([IO.Directory]::Exists($MOD_DIR)) {
        foreach ($f in @([IO.Directory]::GetFiles($MOD_DIR, '*.utoc', [IO.SearchOption]::AllDirectories) | Sort-Object)) {
            if ($f.StartsWith($EXT_DIR, [StringComparison]::OrdinalIgnoreCase)) { continue }
            $fi = New-Object IO.FileInfo($f)
            [void]$sb.Append($f.Substring($MOD_DIR.Length)).Append('|').Append($fi.Length).Append('|').Append($fi.LastWriteTimeUtc.Ticks).Append(';')
        }
    }
    $sha = [Security.Cryptography.SHA1]::Create()
    try { $script:modFp = [BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($sb.ToString()))).Replace('-', '') } finally { $sha.Dispose() }
    return $script:modFp
}
function Get-ExtScores($dir, $utocs) {
    # 取り込んだ MOD の箱が項目ごとに重なるファイルの数 (key → 数)。控えの 1 行目 (版・modules の目印・箱の名前と大きさと日時) が今と同じなら読むだけ
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.Append($TOOL_VER).Append(';').Append((Get-ModulesFingerprint))
    foreach ($u in @($utocs | Sort-Object Name)) { [void]$sb.Append(';').Append($u.Name).Append('|').Append($u.Length).Append('|').Append($u.LastWriteTimeUtc.Ticks) }
    $fp = $sb.ToString()
    $f = Join-Path $dir $SCORE_FILE
    try {
        if (Test-Path -LiteralPath $f) {
            $lines = [IO.File]::ReadAllLines($f)
            if ($lines.Count -ge 1 -and $lines[0] -eq $fp) {
                $score = @{}
                for ($i = 1; $i -lt $lines.Count; $i++) { $j = $lines[$i].IndexOf('='); if ($j -gt 0) { $score[$lines[$i].Substring(0, $j)] = [int]$lines[$i].Substring($j + 1) } }
                return $score
            }
        }
    } catch { }
    $score = @{}
    foreach ($u in @($utocs)) { $sc = Get-BoxKindScores $u.FullName; foreach ($k in $sc.Keys) { $score[$k] = [int]$score[$k] + [int]$sc[$k] } }
    try { $lines = @($fp); foreach ($k in @($score.Keys | Sort-Object)) { $lines += ($k + '=' + $score[$k]) }; [IO.File]::WriteAllLines($f, [string[]]$lines) } catch { }
    return $score
}
function Get-ExtMods {
    # 取り込んだ MOD: 名前・箱・重なる項目 (kinds、KINDS の順)・選ぶ項目 (main)。読み直すのは取り込み・名前の変更・削除・項目の変更のあと
    if ($null -ne $script:extModsCache) { return $script:extModsCache }
    $out = @()
    if (Test-Path -LiteralPath $EXT_DIR) {
        foreach ($sub in @(Get-ChildItem -LiteralPath $EXT_DIR -Directory | Sort-Object Name)) {
            $boxes = @(); $uts = @()          # ($kinds と書くと script の $KINDS を隠してしまう (大小同一))
            foreach ($u in @(Get-ChildItem -LiteralPath $sub.FullName -Filter '*.utoc' -File)) {
                $n = [IO.Path]::GetFileNameWithoutExtension($u.Name)
                if ((Test-Path -LiteralPath (Join-Path $sub.FullName ($n + '.ucas'))) -and (Test-Path -LiteralPath (Join-Path $sub.FullName ($n + '.pak')))) { $boxes += $n; $uts += $u }
            }
            if ($boxes.Count -eq 0) { continue }
            $score = Get-ExtScores $sub.FullName $uts
            $ks = @($KINDS | Where-Object { $score.ContainsKey($_.key) } | ForEach-Object { $_.key })
            $out += @{ name = $sub.Name; dir = $sub.FullName; boxes = $boxes; kinds = $ks; main = (Get-ExtMain $sub.FullName $ks $score) }
        }
    }
    $script:extModsCache = $out
    return $out
}
function Test-ExtHidden($name) {
    # v1.1 (10-02 夜): MOD 管理でチェックを外した取り込んだ MOD (選択肢に出さない)。画面だけの設定 (コマンドラインでは未設定 = いつも $false)
    if (-not $script:extHidden) { return $false }
    return (@($script:extHidden) -contains [string]$name)
}
function Get-OptionList($kind) {
    # ドロップダウンの値: Goldwalker の選択肢 + その項目に該当する取り込んだ MOD ('ext:<名前>')
    $out = @(Get-Options $kind)
    foreach ($e in @(Get-ExtMods)) { if ($e.main -eq $kind.key -and -not (Test-ExtHidden $e.name)) { $out += ('ext:' + $e.name) } }     # v0.13: 選ぶ項目 (main) の 1 か所だけ。v1.1 (10-02 夜): MOD 管理でチェックを外した MOD は並べない
    if ($kind.partItem) { foreach ($c in @(Get-CompatMods)) { $cs0 = Get-CompatSource $c; if (-not $cs0 -or (Test-ExtHidden $cs0.name)) { continue }; foreach ($pt in @($c.parts)) { if ($pt.item -eq $kind.key) { $out += $pt.opt } } } }      # v1.1 (10-02): 互換の部分 (マラトの性器)
    return $out
}
# ---- 互換 (v1.1): 他の作者の衣装 MOD を ELSB の体に合わせた箱 ----
$script:compatCache = $null; $script:compatSrc = @{}
function Get-CompatMods {
    # modules\compat\<id>\manifest.json を読む。返り値: @{ id; title; dir; box; src = @(@{ size; sha }); requires = @(@{ item; choice }); frees = @(項目の key); preview }
    #   読めない・箱がそろっていない・名前が決まり (0ELSB_Compat*_P) に合わない物は使わない
    if ($null -ne $script:compatCache) { return $script:compatCache }
    $out = @()
    if ([IO.Directory]::Exists($COMPAT_DIR)) {
        foreach ($d in @((Get-DirInfo $COMPAT_DIR).subs)) {
            $mf = Join-Path $d 'manifest.json'
            if (-not (Test-Path -LiteralPath $mf)) { continue }
            try { $j = [IO.File]::ReadAllText($mf) | ConvertFrom-Json } catch { continue }
            $bn = [string]$j.box.name
            if ($bn -cnotmatch ('^' + [regex]::Escape($COMPAT_PREFIX) + '[A-Za-z0-9]*_P$')) { continue }
            if (@((Get-DirInfo $d).triples) -notcontains $bn) { continue }
            $src = @()
            foreach ($f in @($j.source.files)) {
                $fx = ([IO.Path]::GetExtension([string]$f.name)).ToLowerInvariant()
                if ($fx -eq '.ucas' -or $fx -eq '.utoc') { $src += @{ size = [long]$f.size; sha = ([string]$f.sha256).ToUpperInvariant() } }      # .pak は UcasPack の共通のファイルで見分けにならない
            }
            if ($src.Count -eq 0) { continue }
            # v1.1 (10-02): source.item = 相手の MOD を並べる項目 (互換が働く項目。Thicc の 2 つは服、Coen's Nude Mod は性器)。取り込んだ MOD の選ぶ項目に使う (Get-ExtMain)
            $sitem = ''; if ($j.source.item -and $KIND_BY_KEY.ContainsKey([string]$j.source.item)) { $sitem = [string]$j.source.item }
            $req = @(); foreach ($r in @($j.requires)) { if ($r -and $r.item) { $req += @{ item = [string]$r.item; choice = [string]$r.choice } } }
            $fr = @(); foreach ($x in @($j.must_beat)) { if ($KIND_BY_KEY.ContainsKey([string]$x)) { $fr += [string]$x } }
            # v1.1 (10-02): keeps = 相手が重なっても ELSB の選択のまま置く項目 (requires の判定は省かない)。extra = 主の箱と一緒に置く箱 (全部そろっていなければ互換ごと使わない)
            $kp = @(); foreach ($x in @($j.keeps)) { if ($KIND_BY_KEY.ContainsKey([string]$x) -and $fr -notcontains [string]$x) { $kp += [string]$x } }
            $ex = @(); $exOk = $true
            foreach ($x in @($j.extra)) {
                if (-not $x) { continue }
                $xb = [string]$x.box
                if ($xb -cnotmatch ('^' + [regex]::Escape($COMPAT_PREFIX) + '[A-Za-z0-9]*_P$') -or $xb -eq $bn -or @((Get-DirInfo $d).triples) -notcontains $xb) { $exOk = $false; break }
                $ex += $xb
            }
            if (-not $exOk) { continue }
            # v1.1 (10-02): dt = 服の表の写し。{ asset; variants = @({ base = modules からの元の箱; base_sha256; box }) }。置く ELSB の箱のうち表が勝つ物から作った写しを置く
            $dtA = ''; $dtV = @()
            if ($j.dt -and $j.dt.asset) {
                $dtA = ([string]$j.dt.asset).ToLowerInvariant()
                foreach ($v in @($j.dt.variants)) {
                    $vb = [string]$v.box
                    if ($vb -cnotmatch ('^' + [regex]::Escape($COMPAT_PREFIX) + '[A-Za-z0-9]*_P$') -or $vb -eq $bn -or @((Get-DirInfo $d).triples) -notcontains $vb) { $exOk = $false; break }
                    $dtV += @{ base = ([string]$v.base).Replace('/', '\').ToLowerInvariant(); sha = ([string]$v.base_sha256).ToUpperInvariant(); box = $vb }
                }
                if (-not $exOk -or $dtV.Count -eq 0) { continue }
            }
            # v1.1 (10-01): 操作キャラ (検証用) の写し。"playas": { "<操作キャラの選択肢>": { "box": "0ELSB_Compat…_P", "base_sha256": "<その選択肢の ELSB_PlayAs_P.ucas>" } }
            $pa = @{}
            if ($j.playas) {
                foreach ($pp in @($j.playas.PSObject.Properties)) {
                    $pb = [string]$pp.Value.box
                    if ($pb -cnotmatch ('^' + [regex]::Escape($COMPAT_PREFIX) + '[A-Za-z0-9]*_P$') -or $pb -eq $bn) { continue }
                    if (@((Get-DirInfo $d).triples) -notcontains $pb) { continue }
                    $pa[[string]$pp.Name] = @{ box = $pb; base = ([string]$pp.Value.base_sha256).ToUpperInvariant() }
                }
            }
            # v1.1 (10-02): parts = 主の条件 (requires) とは別の条件で置く部分 (Coen Nude のマラト用: マラトの体型 = ELSB)。
            #   [{ "id", "title", "requires": [...], "box": "0ELSB_Compat…_P", "extra": [{ "box" }] }]。相手の MOD を置き、その部分の requires を
            #   満たすときだけ置く (主の requires・主の箱を置くかとは別)。箱がそろっていない・名前が決まりに合わない部分があれば互換ごと使わない
            $parts = @()
            foreach ($pt in @($j.parts)) {
                if (-not $pt) { continue }
                $pbn = [string]$pt.box
                if ($pbn -cnotmatch ('^' + [regex]::Escape($COMPAT_PREFIX) + '[A-Za-z0-9]*_P$') -or $pbn -eq $bn -or @((Get-DirInfo $d).triples) -notcontains $pbn) { $exOk = $false; break }
                $preq = @(); foreach ($r in @($pt.requires)) { if ($r -and $r.item) { $preq += @{ item = [string]$r.item; choice = [string]$r.choice } } }
                if ($preq.Count -eq 0) { $exOk = $false; break }
                $pex = @()
                foreach ($x in @($pt.extra)) {
                    if (-not $x) { continue }
                    $xb = [string]$x.box
                    if ($xb -cnotmatch ('^' + [regex]::Escape($COMPAT_PREFIX) + '[A-Za-z0-9]*_P$') -or $xb -eq $bn -or $xb -eq $pbn -or @((Get-DirInfo $d).triples) -notcontains $xb) { $exOk = $false; break }
                    $pex += $xb
                }
                if (-not $exOk) { break }
                # v1.1 (10-02): item = この部分を選択肢に出す項目 (partItem の項目だけ。マラトの性器)。preview = 部分の見本 (互換のフォルダの png)
                $pitem = ''
                if ($pt.item) { $pitem = [string]$pt.item; if (-not $KIND_BY_KEY.ContainsKey($pitem) -or -not $KIND_BY_KEY[$pitem].partItem) { $exOk = $false; break } }
                $pprev = ''
                if ($pt.preview) { $pprev = [string]$pt.preview; if ($pprev -notmatch '^[A-Za-z0-9_.-]+\.png$' -or -not (Test-Path -LiteralPath (Join-Path $d $pprev))) { $pprev = '' } }
                $parts += @{ id = [string]$pt.id; title = $(if ($pt.title) { [string]$pt.title } else { [string]$pt.id }); requires = $preq; box = $pbn; extra = $pex; item = $pitem; preview = $pprev; opt = ('part:' + [string]$j.id + '/' + [string]$pt.id) }
            }
            if (-not $exOk) { continue }
            $out += @{ id = [string]$j.id; title = $(if ($j.title) { [string]$j.title } else { [IO.Path]::GetFileName($d) }); dir = $d; box = $bn; src = $src; requires = $req; frees = $fr; keeps = $kp; extra = $ex; dt = $dtA; dtv = $dtV; preview = (Join-Path $d 'preview.png'); playas = $pa; parts = $parts; srcItem = $sitem }
        }
    }
    $script:compatCache = $out
    return $out
}
function Get-CompatSource($c) {
    # 互換の相手 = manifest の .ucas・.utoc が全部そろっている取り込んだ MOD (大きさでふるってから SHA256)。無ければ $null
    if ($script:compatSrc.ContainsKey($c.id)) { return $script:compatSrc[$c.id] }
    $hit = $null
    foreach ($e in @(Get-ExtMods)) {
        $files = @(Get-ChildItem -LiteralPath $e.dir -File -ErrorAction SilentlyContinue | Where-Object { $_.Extension -eq '.ucas' -or $_.Extension -eq '.utoc' })
        $all = $true
        foreach ($s in $c.src) {
            $ok = $false
            foreach ($f in $files) { if ($f.Length -eq $s.size -and ([string](Get-FileHash256 $f.FullName)).ToUpperInvariant() -eq $s.sha) { $ok = $true; break } }
            if (-not $ok) { $all = $false; break }
        }
        if ($all) { $hit = $e; break }
    }
    $script:compatSrc[$c.id] = $hit
    return $hit
}
function Test-ExtHasCompat($name) {
    # v1.1 (10-02 夜): 取り込んだ MOD $name に ELSB の体に合わせた版 (互換) があるか (中身の SHA256 で照合。Get-CompatSource の控えを使う)
    foreach ($c in @(Get-CompatMods)) { $s = Get-CompatSource $c; if ($s -and $s.name -eq [string]$name) { return $true } }
    return $false
}
function Get-CompatSourceItem($dir) {
    # v1.1 (10-02): 取り込んだ MOD が互換の相手 (manifest の .ucas・.utoc が全部そろう。大きさでふるってから SHA256) なら、manifest の source.item。無ければ ''
    #   Get-ExtMain から呼ぶ (Get-CompatSource は Get-ExtMods を読むので、ここでは使えない)
    $cs = @(@(Get-CompatMods) | Where-Object { $_.srcItem })
    if ($cs.Count -eq 0) { return '' }
    $files = @(Get-ChildItem -LiteralPath $dir -File -ErrorAction SilentlyContinue | Where-Object { $_.Extension -eq '.ucas' -or $_.Extension -eq '.utoc' })
    foreach ($c in $cs) {
        $all = $true
        foreach ($s in $c.src) {
            $ok = $false
            foreach ($f in $files) { if ($f.Length -eq $s.size -and ([string](Get-FileHash256 $f.FullName)).ToUpperInvariant() -eq $s.sha) { $ok = $true; break } }
            if (-not $ok) { $all = $false; break }
        }
        if ($all) { return $c.srcItem }
    }
    return ''
}
function Get-BodyFamilyChoice($key, $choice) {
    if ($key -eq 'anca_body' -and $choice -eq 'booty_pussywalker') { return 'booty' }
    if ($key -eq 'lacra_body' -and $choice -eq 'fitness_pussywalker') { return 'fitness' }
    return [string]$choice
}
function Test-CompatReq($c, $sel, $skipFrees) {
    # requires を満たすか。$skipFrees = 互換で選べるようになる項目 (範囲) の条件は見ない (使えるかどうかの判定用)
    foreach ($r in $c.requires) {
        if ($skipFrees -and ($c.frees -contains $r.item)) { continue }
        if ((Get-BodyFamilyChoice $r.item ([string]$sel[$r.item])) -ne $r.choice) { return $false }
    }
    return $true
}
function Test-CompatWins($c, $e) {
    # 互換の箱の名前が、相手の箱のどれよりも小さい (先に読まれて勝つ) か
    foreach ($b in $e.boxes) { if ([string]::CompareOrdinal($c.box.ToLowerInvariant(), ([string]$b).ToLowerInvariant()) -ge 0) { return $false } }
    return $true
}
function Test-CompatPartReq($p, $sel) {
    # v1.1 (10-02): 互換の部分 (parts) の requires を満たすか
    foreach ($r in $p.requires) { if ((Get-BodyFamilyChoice $r.item ([string]$sel[$r.item])) -ne $r.choice) { return $false } }
    return $true
}
function Test-CompatPartOn($p, $sel, $srcOn) {
    # v1.1 (10-02): 部分を置くか。項目 (item) のある部分は、その項目でこの部分を選び requires を満たすとき (相手の MOD を置くかとは別)。
    #   項目の無い部分は、相手の MOD を置き requires を満たすとき (今までどおり)
    if ($p.item) { return (([string]$sel[$p.item] -eq [string]$p.opt) -and (Test-CompatPartReq $p $sel)) }
    return ([bool]$srcOn -and (Test-CompatPartReq $p $sel))
}
function Get-CompatParts($c, $e, $sel, $srcOn = $true) {
    # v1.1 (10-02): 互換 $c の部分のうち、今の選択で置く物の箱 (@(@{ dir; box; id }))。相手 $e の箱より名前が先 (勝つ) の物だけ
    $out = @()
    foreach ($p in @($c.parts)) {
        if (-not (Test-CompatPartOn $p $sel $srcOn)) { continue }
        if (-not (Test-CompatWins @{ box = $p.box } $e)) { continue }
        $out += @{ dir = $c.dir; box = $p.box; id = $p.id }
        foreach ($xb in @($p.extra)) { $out += @{ dir = $c.dir; box = $xb; id = $p.id } }
    }
    return $out
}
function Get-CompatFor($e, $sel, $full) {
    # 取り込んだ MOD $e の互換で、今の選択で使える最初の 1 つ。$full = $false なら範囲など frees の項目の条件は見ない
    foreach ($c in @(Get-CompatMods)) {
        $s = Get-CompatSource $c
        if (-not $s -or $s.name -ne $e.name) { continue }
        if (-not (Test-CompatWins $c $e)) { continue }
        if (Test-CompatReq $c $sel (-not $full)) { return $c }
    }
    return $null
}
function Get-CompatPlayAs($c, $sel) {
    # 互換 $c の操作キャラ用の写しで、今の操作キャラの選択で置く物 (@{ dir; box })。無い・古い写しなら $null
    #   古い写し = base_sha256 が今の操作キャラの箱 (modules\playas\<選択肢>\ELSB_PlayAs_P.ucas) と違う (操作キャラの箱を作り直した後)。置くと新しい箱を古い中身で上書きするので置かない
    $pv = [string]$sel['playas']
    if (-not $pv -or $pv.StartsWith('ext:') -or -not $c.playas -or -not $c.playas.ContainsKey($pv)) { return $null }
    $pb = $c.playas[$pv]
    if ($pb.base) {
        $kp = $KIND_BY_KEY['playas']
        $u = Join-Path (Get-SourceDir $kp $pv $sel) ($kp.box + '.ucas')      # 10-02: 範囲で分かれる操作キャラ (lacra_A\all など) は、置く方のフォルダの箱と比べる
        if (-not (Test-Path -LiteralPath $u) -or ([string](Get-FileHash256 $u)).ToUpperInvariant() -ne $pb.base) { return $null }
    }
    return @{ dir = $c.dir; box = $pb.box }
}
function Get-CompatDtBox($c, $cands) {
    # v1.1 (10-02): 互換 $c の服の表の写しのうち、今置く ELSB の箱 ($cands = @(@{ dir; box })) で表 ($c.dt) が勝つ箱 (名前が一番小さい) から作った物の箱の名前。
    #   合う写しが無い = '' (ELSB の表が作った時と違う → 互換は置かない)。表を持つ ELSB の箱を置かない = $null (写しは要らない)
    $want = '../../../' + $c.dt + '.uasset'
    $win = $null
    foreach ($x in @($cands)) {
        $a = Get-BoxAssets (Join-Path $x.dir ($x.box + '.utoc'))
        if (-not $a -or @($a) -notcontains $want) { continue }
        if (-not $win -or [string]::CompareOrdinal(([string]$x.box).ToLowerInvariant(), ([string]$win.box).ToLowerInvariant()) -lt 0) { $win = $x }
    }
    if (-not $win) { return $null }
    $full = Join-Path $win.dir $win.box
    $rel = $full.Substring(([string]$MOD_DIR).Length).TrimStart('\').ToLowerInvariant()
    $sha = ([string](Get-FileHash256 ($full + '.ucas'))).ToUpperInvariant()
    foreach ($v in @($c.dtv)) { if ($v.base -eq $rel -and $v.sha -eq $sha) { return $v.box } }
    return ''
}
function Get-CompatInstalled($root) {
    # ~mods に置かれている互換の箱の id
    $paks = Get-PaksDir $root; $out = @()
    foreach ($c in @(Get-CompatMods)) {
        if (Test-Path -LiteralPath (Join-Path $paks ($c.box + '.ucas'))) { $out += $c.id }
        foreach ($p in @($c.parts)) { if (Test-Path -LiteralPath (Join-Path $paks ($p.box + '.ucas'))) { $out += ($c.id + ':' + $p.id) } }      # v1.1 (10-02): 互換の部分
    }
    return $out
}
function Rename-ExtMod($e, $new) {
    # 取り込んだ MOD のフォルダ名を変える。返り値: 新しい名前 ('' なら変えなかった、'exists' なら同じ名前が既にある)
    $new = (([string]$new) -replace '[\\/:*?"<>|]', '_').Trim()
    if (-not $new -or $new -eq $e.name) { return '' }
    if (Test-Path -LiteralPath (Join-Path $EXT_DIR $new)) { return 'exists' }
    Rename-Item -LiteralPath $e.dir -NewName $new
    Reset-ExtCache
    return $new
}
function Preview-Path($kindKey, $o) {
    # 選択肢の見本の場所。バニラ = modules\<種類>\_vanilla.png、取り込んだ MOD = modules\external\<名前>\preview.png
    $kind = $KIND_BY_KEY[[string]$kindKey]
    if (-not $kind) { return $null }
    if (-not $o) { return (Join-Path (Join-Path $MOD_DIR $kind.dir) '_vanilla.png') }
    if (([string]$o).StartsWith('part:')) {
        # v1.1 (10-02): 互換の部分の見本 (manifest の部分の preview、無ければ互換の preview.png)
        foreach ($c in @(Get-CompatMods)) { foreach ($pt in @($c.parts)) { if ($pt.opt -eq [string]$o) { if ($pt.preview) { return (Join-Path $c.dir $pt.preview) }; return $c.preview } } }
        return $null
    }
    if (([string]$o).StartsWith('ext:')) {
        # v1.1: 今の選択で互換を使うなら、ELSB の体に合わせた版の見本
        $e = @(Get-ExtMods) | Where-Object { $_.name -eq ([string]$o).Substring(4) } | Select-Object -First 1
        if ($e -and (Get-Variable -Name rows -Scope Script -ErrorAction SilentlyContinue)) { $c = Get-CompatFor $e (Get-RawSelection) $false; if ($c -and (Test-Path -LiteralPath $c.preview)) { return $c.preview } }
        return (Join-Path (Join-Path $EXT_DIR ([string]$o).Substring(4)) 'preview.png')
    }
    return (Join-Path (Get-OptionDir $kind $o) 'preview.png')
}
function Set-Preview($kindKey, $o, $img) {
    # 画像 (png / jpg) を選択肢の見本にする。返り値: 置いた場所 ('' なら置けない)
    $dst = Preview-Path $kindKey $o
    if (-not $dst) { return '' }
    $ext = ([IO.Path]::GetExtension($img)).ToLowerInvariant()
    if (@('.png', '.jpg', '.jpeg', '.bmp', '.webp') -notcontains $ext) { return '' }
    $d = Split-Path -Parent $dst; if (-not (Test-Path -LiteralPath $d)) { New-Item -ItemType Directory -Path $d -Force | Out-Null }
    if ($ext -eq '.webp') { if (-not (Save-PreviewImage $img $dst)) { return '' } }       # v0.14.3: Nexus の画像 (.webp) は PNG にして置く (読めなければ置かない)
    else { Copy-Item -LiteralPath $img -Destination $dst -Force }
    # v0.14.2: 取り込んだ MOD の見本は本人が付けた印を残す (同じ MOD を取り込み直しても書庫の画像で替えない)
    if (([string]$o).StartsWith('ext:')) { try { [IO.File]::WriteAllText((Join-Path $d $PREVIEW_SRC), 'user') } catch { } }
    return $dst
}
# ---- 取り込んだ MOD の見本 (v0.14.2): 書庫の中の画像を選択肢の見本に ----
#   MOD 作者向けの決まり: 書庫の中の elsb_preview.png (か .jpg) = 見本、elsb_item.txt = 並べる項目 (KINDS の key か none)
#   決まりの無い書庫は、画像が 1 枚だけのときだけ使う (10-02 夜 本人: 名前に preview / thumb / cover を含む画像の手がかりはやめた)。
#   T_ で始まる画像はゲームのテクスチャの元と見て使わない。どれか決められなければ使わない (比較や説明の画像を見本にしないため)
$PREVIEW_OWN = 'elsb_preview'
$PREVIEW_EXTS = @('.png', '.jpg', '.jpeg', '.bmp', '.webp')           # .webp は v0.14.3 から (Nexus の画像)
$PREVIEW_MAX = 1600                         # 取り込む見本の長い辺 (画素)。大きい画像は縮めて PNG で書く
$PREVIEW_SRC = 'elsb_preview_src.txt'       # 取り込んだ MOD のフォルダの中: 見本の出どころ ('user' = 本人が付けた / 'archive:<書庫の中のパス>')
$script:extLastPreview = ''                 # 最後の取り込みで書庫から見本にした画像 (書庫の中のパス。無ければ '')
function Find-ArchivePreview($root) {
    # 展開した書庫のフォルダ ($root) の中の見本の画像。返り値: フルパス ('' なら無い・決められない)
    $imgs = @(Get-ChildItem -LiteralPath $root -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $PREVIEW_EXTS -contains $_.Extension.ToLowerInvariant() })
    if ($imgs.Count -eq 0) { return '' }
    $own = @($imgs | Where-Object { [IO.Path]::GetFileNameWithoutExtension($_.Name).ToLowerInvariant() -eq $PREVIEW_OWN } | Sort-Object { $_.FullName.Split('\').Count }, FullName)
    if ($own.Count -gt 0) { return $own[0].FullName }
    $cand = @($imgs | Where-Object { -not $_.Name.ToLowerInvariant().StartsWith('t_') })
    if ($imgs.Count -eq 1 -and $cand.Count -eq 1) { return $cand[0].FullName }
    # 10-02 夜 本人「1 と 2 だね、それ以外は使わない様にしよう」: 名前の手がかり (preview・thumb・cover) の画像は使わない (elsb_preview か、画像が 1 枚だけのときだけ)
    return ''
}
function Read-AnyImage($path) {
    # 画像を System.Drawing.Bitmap で読む (ファイルは掴まない)。読めなければ $null
    #   .webp (v0.14.3、Nexus の画像) は Windows の画像の部品 (WIC の WebP 画像拡張機能。Windows 10/11 に標準で入っている) で PNG にしてから読む
    Add-Type -AssemblyName System.Drawing
    try {
        $ms = $null
        if (([IO.Path]::GetExtension($path)).ToLowerInvariant() -eq '.webp') {
            Add-Type -AssemblyName PresentationCore
            $fs = [IO.File]::OpenRead($path)
            try {
                $dec = [System.Windows.Media.Imaging.BitmapDecoder]::Create($fs, [System.Windows.Media.Imaging.BitmapCreateOptions]::None, [System.Windows.Media.Imaging.BitmapCacheOption]::OnLoad)
                $enc = New-Object System.Windows.Media.Imaging.PngBitmapEncoder
                $enc.Frames.Add([System.Windows.Media.Imaging.BitmapFrame]::Create($dec.Frames[0]))
                $ms = New-Object IO.MemoryStream
                $enc.Save($ms); $ms.Position = 0
            } finally { $fs.Close() }
        } else {
            $ms = New-Object IO.MemoryStream(, [IO.File]::ReadAllBytes($path))
        }
        try { $tmp = [System.Drawing.Image]::FromStream($ms); $bmp = New-Object System.Drawing.Bitmap($tmp); $tmp.Dispose() } finally { $ms.Dispose() }
        return $bmp
    } catch { return $null }
}
function Save-PreviewImage($src, $dst) {
    # 見本の画像を $dst へ。長い辺が $PREVIEW_MAX より大きい画像は縮めて、.webp はそのままの大きさで、PNG で書く。
    #   それ以外は元のファイルをそのまま写す。返り値: $true / $false (画像として読めない)
    $img = Read-AnyImage $src
    if (-not $img) { return $false }
    try {
        $w = $img.Width; $h = $img.Height
        if ($w -lt 1 -or $h -lt 1) { return $false }
        $sc = $PREVIEW_MAX / [double][math]::Max($w, $h)
        if ($sc -ge 1.0) {
            if (([IO.Path]::GetExtension($src)).ToLowerInvariant() -eq '.webp') { $img.Save($dst, [System.Drawing.Imaging.ImageFormat]::Png) }
            else { Copy-Item -LiteralPath $src -Destination $dst -Force }
            return $true
        }
        $nw = [math]::Max(1, [int][math]::Round($w * $sc)); $nh = [math]::Max(1, [int][math]::Round($h * $sc))
        $bmp = New-Object System.Drawing.Bitmap($nw, $nh)
        try {
            $g = [System.Drawing.Graphics]::FromImage($bmp)
            $ia = New-Object System.Drawing.Imaging.ImageAttributes
            try {
                $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
                $ia.SetWrapMode([System.Drawing.Drawing2D.WrapMode]::TileFlipXY)          # 縁が透けないように
                $g.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $nw, $nh)), 0, 0, $w, $h, [System.Drawing.GraphicsUnit]::Pixel, $ia)
            } finally { $ia.Dispose(); $g.Dispose() }
            $bmp.Save($dst, [System.Drawing.Imaging.ImageFormat]::Png)
        } finally { $bmp.Dispose() }
        return $true
    } finally { $img.Dispose() }
}
function Find-Archiver {
    # 返り値: @{ exe = パス; kind = '7z' | 'winrar' | 'unrar' }。無ければ $null
    $cands = @()
    try { $c = Get-Command '7z.exe' -ErrorAction SilentlyContinue; if ($c) { $cands += @{ exe = $c.Source; kind = '7z' } } } catch { }
    foreach ($d in @("$env:ProgramFiles\7-Zip\7z.exe", "${env:ProgramFiles(x86)}\7-Zip\7z.exe", "$env:LOCALAPPDATA\Programs\7-Zip\7z.exe")) { $cands += @{ exe = $d; kind = '7z' } }
    foreach ($d in @("$env:ProgramFiles\WinRAR\UnRAR.exe", "${env:ProgramFiles(x86)}\WinRAR\UnRAR.exe")) { $cands += @{ exe = $d; kind = 'unrar' } }
    foreach ($d in @("$env:ProgramFiles\WinRAR\WinRAR.exe", "${env:ProgramFiles(x86)}\WinRAR\WinRAR.exe")) { $cands += @{ exe = $d; kind = 'winrar' } }
    foreach ($d in @("$env:ProgramFiles\NVIDIA Corporation\NVIDIA App\7z.exe")) { $cands += @{ exe = $d; kind = '7z' } }
    foreach ($c in $cands) { $ok = $false; try { $ok = Test-Path -LiteralPath $c.exe } catch { }; if ($ok) { return $c } }
    return $null
}
function Expand-Any($archive, $dest) {
    # zip は .NET、rar / 7z などは PC の書庫ソフトで展開する。返り値: $true (展開した) / $false (開く道具が無い)
    $ext = ([IO.Path]::GetExtension($archive)).ToLowerInvariant()
    if ($ext -eq '.zip') {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [IO.Compression.ZipFile]::ExtractToDirectory($archive, $dest); return $true
    }
    $a = Find-Archiver
    if (-not $a) { return $false }
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
    if ($a.kind -eq '7z') { $args2 = @('x', '-y', ('-o' + $dest), $archive) }
    elseif ($a.kind -eq 'unrar') { $args2 = @('x', '-y', $archive, ($dest + '\')) }
    else { $args2 = @('x', '-ibck', '-y', $archive, ($dest + '\')) }
    $pr = Start-Process -FilePath $a.exe -ArgumentList ($args2 | ForEach-Object { if ($_ -match '\s') { '"' + $_ + '"' } else { $_ } }) -Wait -PassThru -WindowStyle Hidden
    if ($pr.ExitCode -ne 0) { throw ('archive extraction failed (' + $a.exe + ' exit ' + $pr.ExitCode + ')') }
    return $true
}
$script:extNoTool = @()
$script:extNoKind = @()
function Get-ImportName($path) {
    # 取り込むときの名前: フォルダはフォルダ名、書庫と箱のファイルは拡張子を除いた名前 (使えない文字は _)
    if (Test-Path -LiteralPath $path -PathType Container) { $n = Split-Path -Leaf $path } else { $n = [IO.Path]::GetFileNameWithoutExtension($path) }
    $n = ([string]$n -replace '[\\/:*?"<>|]', '_').Trim(); if (-not $n) { $n = 'mod' }
    return $n
}
function Get-FreeExtName($name) { $n = $name; $i = 2; while (Test-Path -LiteralPath (Join-Path $EXT_DIR $n)) { $n = $name + ' (' + $i + ')'; $i++ }; return $n }
function Split-ExtVersions($triples, $xroot) {
    # v1.1 (10-02 分家): 取り込む書庫の中の版。同じファイルを上書きし合う箱のまとまり (フォルダが分かれていればフォルダごと、1 つのフォルダなら箱ごと) を別々の版に。
    #   どれとも重ならないまとまり (共通の部品) は全部の版に入れる。上書きし合う組が 2 つ以上に分かれる (髪型と色を別々に選ぶ形など) ときは分けない (今までどおり 1 つ)
    #   返り値: @(@{ label = 版の名前 ('' = 分けない); triples; root = 見本・elsb_item.txt を先に探すフォルダ ('' = 書庫の一番上) })
    $one = @(@{ label = ''; triples = @($triples); root = '' })
    if (@($triples).Count -lt 2) { return $one }
    $dirs = @($triples | ForEach-Object { [string]$_.dir } | Sort-Object -Unique)
    $units = @()
    if ($dirs.Count -gt 1) { foreach ($d in $dirs) { $units += @{ label = ''; triples = @($triples | Where-Object { [string]$_.dir -eq $d }); root = $d } } }
    else { foreach ($t in $triples) { $units += @{ label = ([string]$t.name -replace '_P$', ''); triples = @($t); root = '' } } }
    foreach ($u in $units) {
        $hs = New-Object 'System.Collections.Generic.HashSet[string]'
        foreach ($t in $u.triples) { foreach ($a in @(Read-UtocFiles (Join-Path $t.dir ($t.name + '.utoc')))) { [void]$hs.Add(([string]$a).ToLowerInvariant()) } }
        $u.assets = $hs
    }
    $n = $units.Count; $grp = @(0..($n - 1))
    for ($i = 0; $i -lt $n; $i++) { for ($j = $i + 1; $j -lt $n; $j++) {
        if (-not $units[$i].assets.Overlaps($units[$j].assets)) { continue }
        $gi = $grp[$i]; $gj = $grp[$j]; if ($gi -eq $gj) { continue }
        for ($k = 0; $k -lt $n; $k++) { if ($grp[$k] -eq $gj) { $grp[$k] = $gi } }
    } }
    $sizes = @{}; foreach ($g in $grp) { $sizes[$g] = [int]$sizes[$g] + 1 }
    $multi = @($sizes.Keys | Where-Object { $sizes[$_] -ge 2 })
    if ($multi.Count -ne 1) { return $one }
    $vi = @(); $shared = @()
    for ($i = 0; $i -lt $n; $i++) { if ($grp[$i] -eq $multi[0]) { $vi += $i } else { $shared += @($units[$i].triples) } }
    if ($dirs.Count -gt 1) {
        # 版の名前 = 版のフォルダの、版どうしで共通の親から下の相対パス (区切りは ' - ')
        $paths = @($vi | ForEach-Object { [string]$units[$_].root })
        $common = $paths[0]
        foreach ($pp in $paths) { while ($common -and -not ($pp + '\').StartsWith($common + '\', [StringComparison]::OrdinalIgnoreCase)) { $common = Split-Path -Parent $common } }
        foreach ($i in $vi) { $rel = ([string]$units[$i].root).Substring(([string]$common).Length).TrimStart('\'); if (-not $rel) { $rel = Split-Path -Leaf $units[$i].root }; $units[$i].label = ($rel -replace '\\', ' - ') }
    }
    $out = @()
    foreach ($i in $vi) { $out += @{ label = (([string]$units[$i].label -replace '[\\/:*?"<>|]', '_').Trim()); triples = @($units[$i].triples) + @($shared); root = [string]$units[$i].root } }
    return $out
}
function Import-ExtPath($path, $asName = '') {
    # zip / フォルダ / 箱のファイルを modules\external\<名前>\ に写す。返り値: 取り込んだ名前 ('' なら箱が無かった)
    #   $asName = 取り込む名前 (画面で「別の名前で」を選んだとき)。同じ名前が既にあれば置き換える (本人が選んだ項目 elsb_item.txt は残す)
    if (-not (Test-Path -LiteralPath $EXT_DIR)) { New-Item -ItemType Directory -Path $EXT_DIR -Force | Out-Null }
    $script:extLastPreview = ''
    $tmp = Join-Path $env:TEMP ('gw_ext_' + [Guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $tmp -Force | Out-Null
    $name = ''
    try {
        if ((Test-Path -LiteralPath $path -PathType Container)) {
            $name = Split-Path -Leaf $path; Copy-Item -LiteralPath $path -Destination (Join-Path $tmp 'x') -Recurse -Force
        } elseif (@('.zip', '.rar', '.7z') -contains ([IO.Path]::GetExtension($path)).ToLowerInvariant()) {
            $name = [IO.Path]::GetFileNameWithoutExtension($path)
            if (-not (Expand-Any $path (Join-Path $tmp 'x'))) { $script:extNoTool += $path; return '' }
        } else {
            # .pak / .ucas / .utoc のどれか → 同じ場所の 3 つ組
            $n = [IO.Path]::GetFileNameWithoutExtension($path); $name = $n; $src = Split-Path -Parent $path
            New-Item -ItemType Directory -Path (Join-Path $tmp 'x') -Force | Out-Null
            foreach ($x in '.pak', '.ucas', '.utoc') { $f = Join-Path $src ($n + $x); if (Test-Path -LiteralPath $f) { Copy-Item -LiteralPath $f -Destination (Join-Path $tmp 'x') -Force } }
        }
        # 中の 3 つ組を全部拾う (深い階層も)
        $triples = @()
        foreach ($u in @(Get-ChildItem -LiteralPath (Join-Path $tmp 'x') -Filter '*.utoc' -File -Recurse)) {
            $n = [IO.Path]::GetFileNameWithoutExtension($u.Name); $d = $u.DirectoryName
            if ((Test-Path -LiteralPath (Join-Path $d ($n + '.ucas'))) -and (Test-Path -LiteralPath (Join-Path $d ($n + '.pak')))) { $triples += @{ dir = $d; name = $n } }
        }
        if ($triples.Count -eq 0) { return '' }
        # v0.13: 項目に当たらない MOD も取り込む (MOD 管理のチェックで有効・無効を切り替える)
        if ($asName) { $name = $asName } else { $name = Get-ImportName $path }
        $xroot = Join-Path $tmp 'x'
        # v1.1 (10-02 分家): 1 つの書庫に入った複数の版 (同じファイルを上書きし合う箱のまとまり) は、版ごとに別の MOD (<書庫の名前> - <版>) として取り込む。
        #   版が 1 つなら今までどおり。返り値は名前 (版が複数なら名前の配列)、見本の出どころは $script:extPreviews[<名前>]
        $vers = @(Split-ExtVersions $triples $xroot)
        $names = @(); $script:extPreviews = @{}
        foreach ($ver in $vers) {
            $vname = $(if ($ver.label) { $name + ' - ' + $ver.label } else { $name })
            $vtriples = @($ver.triples)
            $vroot = $(if ($ver.root) { [string]$ver.root } else { $xroot })
            $dst = Join-Path $EXT_DIR $vname
            $keepMain = $null; $keepPrev = $null; $keepSrc = ''
            if (Test-Path -LiteralPath $dst) {
                $mf = Join-Path $dst $MAIN_FILE; if (Test-Path -LiteralPath $mf) { try { $keepMain = [IO.File]::ReadAllText($mf) } catch { $keepMain = $null } }
                # v0.14.2: 前の見本と出どころも覚えておく (本人が付けた見本は取り込み直しても替えない)
                $pf = Join-Path $dst 'preview.png'; if (Test-Path -LiteralPath $pf) { try { $keepPrev = [IO.File]::ReadAllBytes($pf) } catch { $keepPrev = $null } }
                $sf = Join-Path $dst $PREVIEW_SRC; if (Test-Path -LiteralPath $sf) { try { $keepSrc = ([IO.File]::ReadAllText($sf)).Trim() } catch { $keepSrc = '' } }
                Remove-Item -LiteralPath $dst -Recurse -Force
            }
            New-Item -ItemType Directory -Path $dst -Force | Out-Null
            if ($null -ne $keepMain) { try { [IO.File]::WriteAllText((Join-Path $dst $MAIN_FILE), $keepMain) } catch { } }
            foreach ($t in $vtriples) { foreach ($x in '.pak', '.ucas', '.utoc') { Copy-Item -LiteralPath (Join-Path $t.dir ($t.name + $x)) -Destination (Join-Path $dst ($t.name + $x)) -Force } }
            # v0.14.2: MOD 作者の elsb_item.txt (並べる項目、1 行目)。前の取り込みの elsb_item.txt (本人が決めた項目) があればそちらのまま
            #   書いてある項目がこの MOD と重ならなければ、Get-ExtMain が今までどおり重なるファイルの数で選ぶ
            if ($null -eq $keepMain) {
                $ai = @(Get-ChildItem -LiteralPath $vroot -Filter $MAIN_FILE -File -Recurse -ErrorAction SilentlyContinue | Sort-Object { $_.FullName.Split('\').Count }, FullName)
                if ($ai.Count -gt 0) {
                    try {
                        $v = (([IO.File]::ReadAllText($ai[0].FullName)) -split "`r?`n")[0].Trim()
                        if ($v -match '^[A-Za-z0-9_]{1,40}$') { [IO.File]::WriteAllText((Join-Path $dst $MAIN_FILE), $v) }
                    } catch { }
                }
            }
            # v0.14.2: 見本 = 本人が付けた見本 > 書庫の中の画像 (Find-ArchivePreview) > 前の見本。画像の失敗で取り込みは止めない
            $script:extLastPreview = ''
            $pdst = Join-Path $dst 'preview.png'
            if ($keepSrc -eq 'user' -and $null -ne $keepPrev) {
                [IO.File]::WriteAllBytes($pdst, $keepPrev); [IO.File]::WriteAllText((Join-Path $dst $PREVIEW_SRC), 'user')
            } else {
                $pv = ''; $saved = $false
                try { $pv = Find-ArchivePreview $vroot } catch { $pv = '' }
                if (-not $pv -and $vroot -ne $xroot -and @($vers).Count -eq 1) { try { $pv = Find-ArchivePreview $xroot } catch { $pv = '' } }
                if ($pv) { try { $saved = [bool](Save-PreviewImage $pv $pdst) } catch { $saved = $false } }
                if ($saved) {
                    $rel = $pv.Substring($xroot.Length).TrimStart('\')
                    [IO.File]::WriteAllText((Join-Path $dst $PREVIEW_SRC), ('archive:' + $rel)); $script:extLastPreview = $rel
                } elseif ($null -ne $keepPrev) {
                    [IO.File]::WriteAllBytes($pdst, $keepPrev); if ($keepSrc) { [IO.File]::WriteAllText((Join-Path $dst $PREVIEW_SRC), $keepSrc) }
                }
            }
            if ($script:extLastPreview) { $script:extPreviews[$vname] = $script:extLastPreview }
            $names += $vname
        }
        Reset-ExtCache
        if ($names.Count -eq 1) { return $names[0] }
        return ,$names
    } finally {
        try { Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue } catch { }
    }
}
function Test-NeedsMet($kind, $sel) {
    # needs の項目が Goldwalker の選択肢 (バニラでも他の MOD でもない) か
    if (-not $kind.needs) { return $true }
    $nv = [string]$sel[$kind.needs]
    return ([bool]$nv -and -not $nv.StartsWith('ext:'))
}
function Apply-Selection($root, $sel, $extOn) {
    # $sel = @{ body = 'masculine' | 'ext:<MOD名>' | ''; ... }。$extOn = 追加で有効にする取り込んだ MOD の名前 (コマンドラインの -Ext)
    # 返り値: needs が満たされず置かなかった項目 (key の配列)。組み合わせの箱が無くて置かなかった項目は 'pair:<key>'
    $paks = Get-PaksDir $root
    if (-not (Test-Path -LiteralPath $paks)) { New-Item -ItemType Directory -Path $paks -Force | Out-Null }
    $on = @(); foreach ($x in @($extOn)) { if ($x) { $on += $x } }
    $skipped = @()
    # 1. 計画 (~mods はまだ触らない。置く箱が modules に無ければ、何も変えずにここで止める)
    $plan = @()
    foreach ($kind in $KINDS) {
        $o = [string]$sel[$kind.key]
        if (-not $o) {
            # 選択肢のフォルダの _default: 先頭の選択肢 (空) でも、needs を満たせば置く箱 (2026-09-27 マラトの下着の写しを「脱ぐ」より後の名前で)
            if ((@(Get-KindBoxes $kind (Get-OptionDir $kind '_default')).Count -gt 0) -and $kind.needs -and (Test-NeedsMet $kind $sel)) { $o = '_default' } else { $plan += @{ kind = $kind; keep = @() }; continue }
        }
        # 操作キャラ (検証用) はコーエンの APP 20 個を置き換える。ロマンスシーン (同じ APP の 2 個) は置かない
        if (($kind.key -eq 'romance' -or $kind.key -eq 'coen_uw') -and $sel['playas']) { $plan += @{ kind = $kind; keep = @() }; continue }
        # 取り込んだ MOD は ELSB の体型が無くても置く (v0.14.2: needs は ELSB の選択肢のための物。「体の場面」に並んだ服の MOD が、体型がバニラだと置かれなかった)
        if ($o.StartsWith('part:')) { $plan += @{ kind = $kind; keep = @() }; continue }      # v1.1 (10-02): 互換の部分 (下の互換の所で置く)
        if ($o.StartsWith('ext:')) { $plan += @{ kind = $kind; keep = @() }; if ($on -notcontains $o.Substring(4)) { $on += $o.Substring(4) }; continue }
        if (-not (Test-NeedsMet $kind $sel)) { $plan += @{ kind = $kind; keep = @() }; $skipped += $kind.key; continue }
        $src = Get-SourceDir $kind $o $sel
        $bx = @(Get-KindBoxes $kind $src)
        if ($bx.Count -eq 0 -and $kind.pair) { $plan += @{ kind = $kind; keep = @() }; $skipped += ('pair:' + $kind.key); continue }     # 組み合わせの箱が無い (マラトの髭なし) → 置かない
        if ($bx.Count -eq 0) { throw ('module files missing: ' + $src) }
        $plan += @{ kind = $kind; keep = $bx; src = $src }
    }
    # 2. 置き換え (置かない項目は箱を外す。置く項目は、置く箱以外を外してから Place-Box。同じ物は写し直さない、v0.9.1)
    foreach ($l in $LEGACY) { Remove-Box $paks $l }
    foreach ($l in @(Get-OldNameBoxes $paks)) { Remove-Box $paks $l }      # v1.0.1: v1.0 までの名前の箱 (新しい名前で置き直す)
    foreach ($p in $plan) {
        Remove-KindBoxes $paks $p.kind $p.keep
        foreach ($b in $p.keep) { Place-Box $p.src $b $paks }
    }
    foreach ($e in @(Get-ExtMods)) {
        foreach ($b in $e.boxes) {
            # v1.1 (10-02 分家): 肌の項目の MOD は名前を替えて置くことがある (Get-ExtPlaceName)。置かない名前の方は外す
            $pn = Get-ExtPlaceName $e $b
            foreach ($v in @(Get-ExtBoxVariants $b)) { if ($v -ne $pn -or $on -notcontains $e.name) { Remove-Box $paks $v } }
            if ($on -contains $e.name) { Place-BoxAs $e.dir $b $paks $pn }
        }
    }
    # 共通の箱 (下で置く) の名前。互換の服の表の写しを選ぶのに先に要る (10-02)
    $coreBoxes = @()
    if (Test-Path -LiteralPath $CORE_DIR) {
        foreach ($u in @(Get-ChildItem -LiteralPath $CORE_DIR -Filter ($BOX_PREFIX + 'ZCore*_P.ucas') -File | Sort-Object Name)) {
            $n = [IO.Path]::GetFileNameWithoutExtension($u.Name)
            if ((Test-Path -LiteralPath (Join-Path $CORE_DIR ($n + '.utoc'))) -and (Test-Path -LiteralPath (Join-Path $CORE_DIR ($n + '.pak')))) { $coreBoxes += $n }
        }
    }
    # 互換 (v1.1): 置いた取り込んだ MOD に合う互換の箱を、requires (体型・範囲) を満たすときだけ置く。1 つの MOD に 1 つ。それ以外の互換の箱は外す
    $cOn = @(); $cSrc = @(); $cDt = @{}
    $elsbPlaced = @(); foreach ($p in $plan) { foreach ($b in @($p.keep)) { $elsbPlaced += @{ dir = $p.src; box = $b } } }
    foreach ($b in $coreBoxes) { $elsbPlaced += @{ dir = $CORE_DIR; box = $b } }      # 互換を置くときは取り込んだ MOD も置く = 共通の箱も置く
    foreach ($c in @(Get-CompatMods)) {
        $e = Get-CompatSource $c
        if (-not $e -or $on -notcontains $e.name -or $cSrc -contains $e.name) { continue }
        if (-not (Test-CompatReq $c $sel $false)) { continue }
        if (-not (Test-CompatWins $c $e)) { $skipped += ('compat:' + $c.id); continue }      # 相手の箱の名前の方が小さい (000_… など) → 置いても負けるので置かない
        if ($c.dt) {
            # v1.1 (10-02): 服の表の写し (Thicc Lacra: 上着の行の体を隠す設定を 0)。置く ELSB の箱のうち表が勝つ物から作った写しを置く。
            #   合う写しが無い = ELSB の表が作った後に変わった → 古い表で上書きしないよう互換ごと置かない (作り直しが要る)
            $db = Get-CompatDtBox $c $elsbPlaced
            if ($db -eq '') { $skipped += ('compatdt:' + $c.id); continue }
            if ($db) { $cDt[$c.id] = $db }
        }
        $cOn += $c; $cSrc += $e.name
    }
    # v1.1 (10-01): 操作キャラ (検証用) の写し。互換の箱を置き、操作キャラがその選択肢のときだけ (manifest の playas。肌着を外した APP の写しなど)
    $cExtra = @(); foreach ($c in $cOn) { $x = Get-CompatPlayAs $c $sel; if ($x) { $cExtra += $x } }
    foreach ($c in $cOn) { if ($cDt.ContainsKey($c.id)) { $cExtra += @{ dir = $c.dir; box = $cDt[$c.id] } } }      # 10-02: 服の表の写し
    # v1.1 (10-02): 互換の部分 (parts)。相手の MOD を置くとき、部分ごとの requires を満たせば置く (主の requires・主の箱を置くかとは別。
    #   Coen Nude: 主 = コーエンの体型 ELSB、部分 marat = マラトの体型 ELSB)
    $cPartDone = @()
    foreach ($c in @(Get-CompatMods)) {
        if (-not @($c.parts).Count) { continue }
        $e = Get-CompatSource $c
        if (-not $e -or $cPartDone -contains $c.id) { continue }
        $cPartDone += $c.id
        $srcOn = ($on -contains $e.name)      # 10-02: 項目のある部分 (マラトの性器) は相手の MOD を置かなくても置く
        foreach ($x in @(Get-CompatParts $c $e $sel $srcOn)) { $cExtra += $x }
        foreach ($p in @($c.parts)) { if ((Test-CompatPartOn $p $sel $srcOn) -and -not (Test-CompatWins @{ box = $p.box } $e)) { $skipped += ('compat:' + $c.id) } }
    }
    $cWant = @($cOn | ForEach-Object { $_.box }) + @($cOn | ForEach-Object { @($_.extra) }) + @($cExtra | ForEach-Object { $_.box })
    foreach ($b in @(Get-ChildItem -LiteralPath $paks -Filter ($COMPAT_PREFIX + '*') -File -ErrorAction SilentlyContinue)) {
        $n = [IO.Path]::GetFileNameWithoutExtension($b.Name)
        if ($cWant -notcontains $n) { Remove-Box $paks $n }
    }
    foreach ($c in $cOn) { Place-Box $c.dir $c.box $paks; foreach ($xb in @($c.extra)) { Place-Box $c.dir $xb $paks } }      # 10-02: extra (画像の箱など) も一緒に
    foreach ($x in $cExtra) { Place-Box $x.dir $x.box $paks }
    # 共通の箱: Goldwalker の箱か取り込んだ MOD を 1 つでも置いたら置く (服の表にコーエンの装備の写しの行があり、写しの中身がこの箱に入っている)。何も置かないなら外す
    #   ($coreBoxes は互換の前で集めた)
    $anyPlaced = ($on.Count -gt 0)
    foreach ($kind in $KINDS) { if (@(Get-KindBoxes $kind $paks).Count -gt 0) { $anyPlaced = $true; break } }
    foreach ($b in @(Get-ChildItem -LiteralPath $paks -Filter ($BOX_PREFIX + 'ZCore*_P.ucas') -File -ErrorAction SilentlyContinue)) {
        $n = [IO.Path]::GetFileNameWithoutExtension($b.Name)
        if (-not $anyPlaced -or $coreBoxes -notcontains $n) { Remove-Box $paks $n }
    }
    if ($anyPlaced) {
        foreach ($b in $coreBoxes) { Place-Box $CORE_DIR $b $paks }
    }
    return $skipped
}
function Get-ExtInstalled($root) {
    $paks = Get-PaksDir $root; $on = @()
    foreach ($e in @(Get-ExtMods)) { $all = $true; foreach ($b in $e.boxes) { if (-not (Test-ExtBoxPlaced $paks $b)) { $all = $false } }; if ($all) { $on += $e.name } }
    return $on
}

# ---- MOD 管理 (v0.13): ~mods の中の MOD (ELSB の箱と取り込んだ MOD 以外) と、外してある MOD ----
#   無効にした MOD は Paks の外 (Dawnwalker\Content\ELSB_DisabledMods) へ移す (Paks の中のフォルダはゲームが全部読むため。消さない)
function Get-DisabledDir($root) { return (Join-Path $root 'Dawnwalker\Content\ELSB_DisabledMods') }
function Test-ElsbBox($name) { return ((([string]$name) -like ($BOX_PREFIX + '*')) -or (([string]$name) -like ($OLD_BOX_PREFIX + '*')) -or (([string]$name) -like ($COMPAT_PREFIX + '*')) -or (([string]$name) -like ($OVL_PREFIX + '*'))) }      # v1.0.1: 前の名前も、v1.1: 互換の箱も
$MOD_FAMILIES = @(
    @{ prefix = 'DawnwalkerQoL_'; label = 'BoDQS' },
    @{ prefix = 'DawnwalkerStealth_'; label = 'DawnwalkerStealth' }
)     # 箱の多い自作の MOD は 1 行にまとめる (BoDQS は設定の項目ごとに箱が分かれて 20 組になる)。チェック 1 つで全部の箱を移す
function Get-ModEntries($root) {
    # 返り値: 取り込んだ MOD (type ext) + ~mods にある MOD (paks) + 外してある MOD (off)
    $out = @()
    $exts = @(Get-ExtMods); $extBox = @{}
    foreach ($e in $exts) { foreach ($b in $e.boxes) { foreach ($v in @(Get-ExtBoxVariants $b)) { $extBox[([string]$v).ToLowerInvariant()] = $e.name } } }
    $paks = $(if ($root) { Get-PaksDir $root } else { $null })
    foreach ($e in $exts) {
        $on = [bool]$paks
        foreach ($b in $e.boxes) { if (-not $paks -or -not (Test-ExtBoxPlaced $paks $b)) { $on = $false } }
        $out += @{ id = 'ext:' + $e.name; type = 'ext'; name = $e.name; ext = $e; boxes = @($e.boxes); utocs = @($e.boxes | ForEach-Object { Join-Path $e.dir ($_ + '.utoc') }); on = $on; rel = ''; files = @(); base = $e.dir }
    }
    if (-not $root) { return $out }
    foreach ($loc in @(@{ d = $paks; on = $true; t = 'paks' }, @{ d = (Get-DisabledDir $root); on = $false; t = 'off' })) {
        if (-not (Test-Path -LiteralPath $loc.d)) { continue }
        $groups = @{}
        foreach ($f in @(Get-ChildItem -LiteralPath $loc.d -File -Recurse -ErrorAction SilentlyContinue | Where-Object { @('.pak', '.ucas', '.utoc', '.sig') -contains $_.Extension.ToLowerInvariant() })) {
            $n = [IO.Path]::GetFileNameWithoutExtension($f.Name)
            if (Test-ElsbBox $n) { continue }
            if ($loc.on -and $extBox.ContainsKey($n.ToLowerInvariant())) { continue }        # 取り込んだ MOD の箱 (上の行で出す)
            $rel = $f.DirectoryName.Substring($loc.d.Length).TrimStart('\')
            $gk = ($rel + '\' + $n).ToLowerInvariant()
            if (-not $groups.ContainsKey($gk)) { $groups[$gk] = @{ name = $n; rel = $rel; files = @() } }
            $groups[$gk].files += $f.FullName
        }
        $fam = @{}
        foreach ($gk in @($groups.Keys | Sort-Object)) {
            $g = $groups[$gk]
            if (-not @($g.files | Where-Object { $_.ToLowerInvariant().EndsWith('.pak') }).Count) { continue }     # .pak の無い物は MOD ではない
            $ut = @($g.files | Where-Object { $_.ToLowerInvariant().EndsWith('.utoc') })
            $fm = $null; foreach ($f0 in $MOD_FAMILIES) { if (([string]$g.name).StartsWith($f0.prefix, [StringComparison]::OrdinalIgnoreCase)) { $fm = $f0; break } }
            if ($fm) {
                $fk = ($g.rel + '\' + $fm.label).ToLowerInvariant()
                if (-not $fam.ContainsKey($fk)) { $fam[$fk] = @{ id = $loc.t + ':family:' + $fk; type = $loc.t; name = $fm.label + ' (' + $fm.prefix + '*)'; family = $fm.label; boxes = @(); utocs = @(); files = @(); on = $loc.on; rel = $g.rel; base = $loc.d } }
                $fam[$fk].boxes += $g.name; $fam[$fk].utocs += $ut; $fam[$fk].files += @($g.files)
                continue
            }
            $out += @{ id = $loc.t + ':' + $gk; type = $loc.t; name = $g.name; boxes = @($g.name); utocs = $ut; files = @($g.files); on = $loc.on; rel = $g.rel; base = $loc.d }
        }
        foreach ($fk in @($fam.Keys | Sort-Object)) { $out += $fam[$fk] }
    }
    return $out
}
function Set-ModEnabled($root, $m, $on) {
    Assert-ManualTarget $root
    # ~mods と ELSB_DisabledMods の間でファイルを移す (消さない・上書きしない)。取り込んだ MOD はここでは扱わない (項目の選択・チェックで置く)
    #   返り値: '' = 移した (または移す必要なし) / 'exists:<ファイル名>' = 移す先に同じ名前があるので何も移さなかった。途中で失敗したら移した分を戻して例外
    if ($m.type -eq 'ext' -or [bool]$m.on -eq [bool]$on) { return '' }
    $dst = $(if ($on) { Get-PaksDir $root } else { Get-DisabledDir $root })
    $to = $(if ($m.rel) { Join-Path $dst $m.rel } else { $dst })
    foreach ($f in $m.files) { $t = Join-Path $to (Split-Path -Leaf $f); if (Test-Path -LiteralPath $t) { return ('exists:' + (Split-Path -Leaf $f)) } }
    if (-not (Test-Path -LiteralPath $to)) { New-Item -ItemType Directory -Path $to -Force | Out-Null }
    $moved = @()
    try {
        foreach ($f in $m.files) { $t = Join-Path $to (Split-Path -Leaf $f); Move-Item -LiteralPath $f -Destination $t; $moved += , @($f, $t) }
    } catch {
        for ($i = $moved.Count - 1; $i -ge 0; $i--) { try { Move-Item -LiteralPath $moved[$i][1] -Destination $moved[$i][0] } catch { } }
        throw
    }
    return ''
}
function Get-ModSubjects($assets) {
    # 箱が変える人 (パスの名前で判定)。表示用の文字の key
    $s = @()
    if (-not $assets -or @($assets).Count -eq 0) { return @('subjNone') }
    $all = (@($assets) -join "`n")
    if ($all -match '/appearance/player/|hma_coen|_coen_') { $s += 'subjCoen' }
    if ($all -match 'anca') { $s += 'subjAnca' }
    if ($all -match 'lacra') { $s += 'subjLacra' }
    if ($all -match 'marat') { $s += 'subjMarat' }
    if ($all -match 'hfa_common') { $s += 'subjWomen' }
    if ($all -match 'hma_common') { $s += 'subjMen' }
    if ($s.Count -eq 0 -and $all -match '/characters/') { $s += 'subjOther' }
    if ($s.Count -eq 0) { $s += 'subjNone' }
    return $s
}
function Get-ElsbInstalledBoxes($root) {
    # ~mods に置かれている ELSB の箱と、その項目
    $paks = Get-PaksDir $root; $out = @()
    if (-not (Test-Path -LiteralPath $paks)) { return $out }
    foreach ($u in @(Get-ChildItem -LiteralPath $paks -Filter '*.utoc' -File | Where-Object { Test-ElsbBox $_.Name })) {
        $n = [IO.Path]::GetFileNameWithoutExtension($u.Name); $lab = ''; $nn = Get-NewBoxName $n; $cp = ''
        foreach ($kind in $KINDS) { $re = '^' + [regex]::Escape(($kind.box -replace '_P$', '')) + '[A-Za-z0-9]*_P$'; if ($nn -cmatch $re) { $lab = $kind.key; break } }
        if ($n -like ($COMPAT_PREFIX + '*')) { $cp = $n; foreach ($c in @(Get-CompatMods)) { if ($c.box -eq $n -or @($c.extra) -contains $n -or @(@($c.dtv) | ForEach-Object { $_.box }) -contains $n) { $cp = $c.title; break }; foreach ($pk in @($c.playas.Keys)) { if ($c.playas[$pk].box -eq $n) { $cp = $c.title + ' (' + (T 'playas') + ': ' + $pk + ')' } }; foreach ($pt in @($c.parts)) { if ($pt.box -eq $n -or @($pt.extra) -contains $n) { $cp = $c.title + ' (' + $pt.title + ')' } } } }      # v1.1: 互換の箱 (操作キャラの写し・extra・部分も)
        $out += @{ name = $n; utoc = $u.FullName; kind = $lab; compat = $cp }
    }
    return $out
}
function Get-EntryBoxName($m, $u) {
    # v1.1 (10-02 夜): ~mods での箱の名前。取り込んだ肌の項目の MOD は 0ELSB_Skin_ を付けて置くので、名前の順はその名前で比べる
    $b = [IO.Path]::GetFileNameWithoutExtension([string]$u)
    if ($m.type -eq 'ext') { return (Get-ExtPlaceName $m.ext $b) }
    return $b
}
function Get-CompatOfBox($n) {
    # v1.1 (10-02 夜): 互換の箱 (主・extra・服の表の写し・操作キャラ・部分) の名前 → その互換。無ければ $null
    foreach ($c in @(Get-CompatMods)) {
        if ($c.box -eq $n -or @($c.extra) -contains $n -or @(@($c.dtv) | ForEach-Object { $_.box }) -contains $n) { return $c }
        foreach ($pk in @($c.playas.Keys)) { if ($c.playas[$pk].box -eq $n) { return $c } }
        foreach ($pt in @($c.parts)) { if ($pt.box -eq $n -or @($pt.extra) -contains $n) { return $c } }
    }
    return $null
}
function Get-ModConflicts($root, $entries) {
    # 返り値: id → 相手ごとの @{ other = 表示名; n = 重なるファイルの数; win = 名前が小さい (勝つ) か; elsb; src }。相手は有効な MOD と、置かれている ELSB の箱
    #   v1.1 (10-02 夜): $script:modLost[id] = @{ total = この MOD のファイルの数; elsb = ELSB の箱の方が使われるファイルの数; mods = ほかの MOD の方が使われる数 } (一覧の印)
    #   v1.1 (10-02 夜 2): 互換の箱は相手の MOD の名前で数える (src = 相手の MOD の名前)。取り込んだ肌の MOD の箱 (0ELSB_Skin_) は ELSB の箱にせず、その MOD の行で
    #     (前は「ELSB (共通)」として数え、置いた名前で先に読まれる自分に負けて「使われない」になっていた)
    $own = @{}; $parts = @(); $script:modLost = @{}
    foreach ($m in $entries) { if (-not $m.on) { continue }; foreach ($u in $m.utocs) { $parts += @{ id = $m.id; label = [string]$m.name; box = (Get-EntryBoxName $m $u); utoc = $u } } }
    foreach ($b in @(Get-ElsbInstalledBoxes $root)) {
        if (([string]$b.name).StartsWith($OVL_PREFIX)) { continue }
        $src = ''
        if ($b.compat) { $c0 = Get-CompatOfBox ([string]$b.name); if ($c0) { $s0 = Get-CompatSource $c0; if ($s0) { $src = [string]$s0.name } } }
        $lab = $(if ($src) { $src } elseif ($b.compat) { [string]::Format((T 'elsbCompat'), $b.compat) } elseif ($b.kind) { [string]::Format((T 'elsbItem'), (T $b.kind)) } else { (T 'elsbCore') })
        $parts += @{ id = 'elsb:' + $b.name; label = $lab; box = $b.name; utoc = $b.utoc; elsb = $true; src = $src }
    }
    foreach ($p in $parts) {
        $a = Get-BoxAssets $p.utoc
        if (-not $a) { continue }
        foreach ($x in $a) {
            if (-not $own.ContainsKey($x)) { $own[$x] = New-Object System.Collections.ArrayList }
            [void]$own[$x].Add($p)
        }
    }
    $out = @{}
    foreach ($m in $entries) {
        $acc = @{}; $tot = @{}; $lostE = @{}; $lostM = @{}
        foreach ($u in $m.utocs) {
            $bx = (Get-EntryBoxName $m $u).ToLowerInvariant()
            $a = Get-BoxAssets $u
            if (-not $a) { continue }
            foreach ($x in $a) {
                $tot[$x] = $true
                if (-not $own.ContainsKey($x)) { continue }
                foreach ($o in $own[$x]) {
                    if ($o.id -eq $m.id) { continue }
                    if ([string]::CompareOrdinal(([string]$o.box).ToLowerInvariant(), $bx) -lt 0) { if ($o.elsb) { $lostE[$x] = $true } else { $lostM[$x] = $true } }
                    if (-not $acc.ContainsKey($o.label)) { $acc[$o.label] = @{ other = $o.label; n = 0; win = ([string]::CompareOrdinal($bx, ([string]$o.box).ToLowerInvariant()) -lt 0); elsb = [bool]$o.elsb; src = [string]$o.src } }
                    $acc[$o.label].n = $acc[$o.label].n + 1
                }
            }
        }
        $out[$m.id] = @($acc.Values | Sort-Object -Property @{ Expression = { $_.n }; Descending = $true })
        $script:modLost[$m.id] = @{ total = $tot.Count; elsb = @($lostE.Keys | Where-Object { -not $lostM.ContainsKey($_) }).Count; mods = $lostM.Count }
    }
    return $out
}

# ---------------------------------------------------------------------------
#  コマンドライン
# ---------------------------------------------------------------------------
. (Join-Path $PSScriptRoot 'SharedInstaller.ps1')
if ($LibraryOnly) { return }
if ($Plan) {
    $selected = Get-RequestedSelection
    Get-SharedPlan $selected @(([string]$ARG_EXT).Split(',') | Where-Object { $_ }) | ConvertTo-Json -Depth 30
    return
}
if ($Import.Count -gt 0) {
    # 1 つの引数に「,」区切りで複数を書いてもよい (bash 等から渡すと 1 つの文字列になる)
    $Import = @($Import | ForEach-Object { if (Test-Path -LiteralPath $_) { $_ } else { $_.Split(',') } } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    foreach ($p in $Import) {
        $n = Import-ExtPath $p
        # v1.1 (10-02 分家): 版が複数の書庫は名前が複数 (1 行ずつ)
        if ($n) { foreach ($nn in @($n)) { $pvRel = [string]$script:extPreviews[$nn]; $e = @(Get-ExtMods) | Where-Object { $_.name -eq $nn } | Select-Object -First 1; Write-Output ('imported ' + $nn + ' [' + ($e.boxes -join '+') + '] (' + ($e.kinds -join ',') + ') main=' + $e.main + $(if ($pvRel) { ' preview=' + $pvRel } else { '' })) } }
        elseif ($script:extNoTool -contains $p) { Write-Output ('NG: no archiver for ' + $p) }
        elseif ($script:extNoKind -contains $p) { Write-Output ('NG: no matching item in ' + $p) }
        else { Write-Output ('NG: no container in ' + $p) }
    }
    exit 0
}
if ($SetPreview.Count -gt 0) {
    $a = @($SetPreview); if ($a.Count -eq 1) { $a = @($a[0].Split(',')) }
    if ($a.Count -ne 3) { Write-Output 'NG: -SetPreview <kind>,<option>,<image>'; exit 3 }
    $k = $a[0].Trim(); $o = $a[1].Trim(); if ($o -eq 'vanilla' -or $o -eq 'none') { $o = '' }
    $kd = $KINDS | Where-Object { $_.key -eq $k } | Select-Object -First 1
    if (-not $kd) { Write-Output ('NG: unknown kind ' + $k); exit 3 }
    if ($o -and ((Get-OptionList $kd) -notcontains $o)) { Write-Output ('NG: unknown option ' + $o); exit 3 }
    if (-not (Test-Path -LiteralPath $a[2].Trim())) { Write-Output ('NG: no image ' + $a[2]); exit 3 }
    $dst = Set-Preview $k $o $a[2].Trim()
    if (-not $dst) { Write-Output 'NG: not an image (png / jpg / bmp / webp) or it could not be read'; exit 3 }
    Write-Output ('preview set: ' + $dst); exit 0
}
if ($Rename.Count -gt 0) {
    $pair = @($Rename); if ($pair.Count -eq 1) { $pair = @($pair[0].Split(',')) }
    if ($pair.Count -ne 2) { Write-Output 'NG: -Rename <old>,<new>'; exit 3 }
    $e = @(Get-ExtMods) | Where-Object { $_.name -eq $pair[0].Trim() } | Select-Object -First 1
    if (-not $e) { Write-Output ('NG: unknown external mod ' + $pair[0]); exit 3 }
    $r = Rename-ExtMod $e $pair[1].Trim()
    if ($r -eq 'exists') { Write-Output ('NG: exists ' + $pair[1]); exit 3 }
    if (-not $r) { Write-Output 'NG: not renamed'; exit 3 }
    $ini = Read-Ini; foreach ($kind in $KINDS) { if ($ini['sel_' + $kind.key] -eq ('ext:' + $e.name)) { $ini['sel_' + $kind.key] = 'ext:' + $r } }
    if ($ini['ext_hidden']) { $ini['ext_hidden'] = ((([string]$ini['ext_hidden']).Split('|') | ForEach-Object { if ($_ -eq $e.name) { $r } else { $_ } }) -join '|') }      # v1.1 (10-02 夜): 出さない設定も付いていく
    Write-Ini $ini
    Write-Output ('renamed ' + $e.name + ' -> ' + $r); exit 0
}
if ($Inspect -eq 'ext') {
    foreach ($e in @(Get-ExtMods)) { Write-Output ($e.name + ' boxes=' + ($e.boxes -join '+') + ' kinds=' + ($e.kinds -join ',') + ' dir=' + $e.dir); foreach ($b in $e.boxes) { Write-Output ('   ' + $b + ' -> ' + ((@(Get-BoxKinds (Join-Path $e.dir ($b + '.utoc')))) -join ',')) } }
    exit 0
}
if ($Inspect) {
    $a = @(Get-BoxAssets $Inspect)
    Write-Output ('assets ' + $a.Count + ' kinds ' + ((@(Get-BoxKinds $Inspect)) -join ','))
    $isc = Get-BoxKindScores $Inspect; $iks = @($KINDS | Where-Object { $isc.ContainsKey($_.key) } | ForEach-Object { $_.key })
    Write-Output ('scores ' + (($iks | ForEach-Object { $_ + '=' + $isc[$_] }) -join ' ') + ' main=' + (Get-ExtMain (Split-Path -Parent $Inspect) $iks $isc))      # v0.14.2: 取り込んだときに選ぶ項目の見込み
    foreach ($x in ($a | Select-Object -First 6)) { Write-Output ('  ' + $x) }
    $sig = Get-KindSignature; foreach ($kind in $KINDS) { Write-Output ('  sig ' + $kind.key + ' ' + $sig[$kind.key].Count + ' e.g. ' + (@($sig[$kind.key].Keys | Select-Object -First 1) -join '')) }
    exit 0
}
if ($List) {
    foreach ($kind in $KINDS) { Write-Output ($kind.key + ': ' + ((Get-Options $kind) -join ', ')) }
    Write-Output ('external: ' + ((@(Get-ExtMods) | ForEach-Object { $_.name + '[' + ($_.boxes -join '+') + '] (' + ($_.kinds -join ',') + ') main=' + $_.main }) -join ', '))
    Write-Output ('compat: ' + ((@(Get-CompatMods) | ForEach-Object { $s = Get-CompatSource $_; $_.id + '[' + $_.box + '] source=' + $(if ($s) { $s.name + $(if (Test-CompatWins $_ $s) { '' } else { '(lose)' }) } else { '-' }) + ' requires=' + (($_.requires | ForEach-Object { $_.item + '=' + $_.choice }) -join '+') + ' frees=' + ($_.frees -join '+') + $(if (@($_.keeps).Count) { ' keeps=' + (@($_.keeps) -join '+') } else { '' }) + $(if (@($_.extra).Count) { ' extra=' + (@($_.extra) -join '+') } else { '' }) + $(if ($_.dt) { ' dt=' + @($_.dtv).Count + '[' + ((@($_.dtv) | ForEach-Object { $_.box } | Sort-Object -Unique) -join '+') + ']' } else { '' }) + $(if ($_.playas.Count) { $c0 = $_; ' playas=' + ((@($c0.playas.Keys) | Sort-Object | ForEach-Object { $_ + '[' + $c0.playas[$_].box + ']' }) -join '+') } else { '' }) + $(if (@($_.parts).Count) { ' parts=' + ((@($_.parts) | ForEach-Object { $_.id + '[' + $_.box + $(if (@($_.extra).Count) { '+' + (@($_.extra) -join '+') } else { '' }) + '](' + (($_.requires | ForEach-Object { $_.item + '=' + $_.choice }) -join '+') + ')' + $(if ($_.item) { '@' + $_.item } else { '' }) }) -join '+') } else { '' }) }) -join ', '))
    exit 0
}
if ($ModList -or $ModOn -or $ModOff) {
    $root = Resolve-GameRoot $ARG_ROOT
    if ($ARG_ROOT -and -not $root) { Write-Output ('NG: not a game folder (Dawnwalker\Binaries\Win64\Dawnwalker.exe not found): ' + $ARG_ROOT); exit 2 }     # 指定のフォルダが違うとき、本物のゲームに切り替えない (09-26 の事故)
    if (-not $root) { $ins = @(Find-AllInstalls); if ($ins.Count -gt 0) { $root = $ins[0] } }
    if (-not $root) { Write-Output 'NG: game folder not found'; exit 2 }
    $ents = @(Get-ModEntries $root)
    if ($ModOn -or $ModOff) {
        $want = $(if ($ModOn) { $ModOn } else { $ModOff }); $on = [bool]$ModOn
        $hit = @($ents | Where-Object { $_.type -ne 'ext' -and ($_.name -eq $want -or [string]$_.family -eq $want) })
        $m = $hit | Where-Object { [bool]$_.on -ne $on } | Select-Object -First 1
        if (-not $m) { $m = $hit | Select-Object -First 1 }
        if (-not $m) { Write-Output ('NG: unknown mod ' + $want); exit 3 }
        if (Test-GameRunning) { Write-Output 'NG: the game is running'; exit 5 }
        $rr = Set-ModEnabled $root $m $on
        if ($rr) { Write-Output ('NG: not moved (' + $rr + ')'); exit 6 }
        Write-Output ('OK ' + $want + ' -> ' + $(if ($on) { 'on' } else { 'off' })); exit 0
    }
    $cf = Get-ModConflicts $root $ents
    foreach ($m in $ents) {
        $a = @(); foreach ($u in $m.utocs) { $x = Get-BoxAssets $u; if ($x) { $a += $x } }
        $sub = $(if (@($m.utocs).Count -eq 0) { '?' } else { ((Get-ModSubjects $a) | ForEach-Object { T $_ }) -join ',' })
        $rel = (@($cf[$m.id]) | ForEach-Object { $_.other + $(if ($_.win) { ' win ' } else { ' lose ' }) + $_.n }) -join '; '
        Write-Output ($m.type + ' | ' + $m.name + ' | on=' + $m.on + ' | main=' + $(if ($m.ext) { $m.ext.main } else { '' }) + ' | ' + $sub + ' | ' + $rel)
    }
    exit 0
}
if ($Apply -or $RemoveAll) {
    if (Test-InsidePaks) { Write-Output 'NG: the tool is inside the Paks folder'; exit 4 }
    $root = Resolve-GameRoot $ARG_ROOT
    if ($ARG_ROOT -and -not $root) { Write-Output ('NG: not a game folder (Dawnwalker\Binaries\Win64\Dawnwalker.exe not found): ' + $ARG_ROOT); exit 2 }     # 指定のフォルダが違うとき、本物のゲームに切り替えない (09-26 の事故)
    if (-not $root) { $ins = @(Find-AllInstalls); if ($ins.Count -gt 0) { $root = $ins[0] } }
    if (-not $root) { Write-Output 'NG: game folder not found'; exit 2 }
    $sel = Get-RequestedSelection
    if ($RemoveAll) { foreach ($kind in $KINDS) { $sel[$kind.key] = '' } }
    $extOn = @(); if (-not $RemoveAll -and $ARG_EXT) { $extOn = @($ARG_EXT.Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ }) }
    $known = @(@(Get-ExtMods) | ForEach-Object { $_.name })
    foreach ($e in $extOn) { if ($known -notcontains $e) { Write-Output ('NG: unknown external mod ' + $e); exit 3 } }
    $reset = @(Apply-Selection $root $sel $extOn)
    $now = Get-Installed $root $sel
    Write-Output ('OK ' + $root + ' -> ' + (($KINDS | ForEach-Object { $_.key + '=' + $now[$_.key] }) -join ' ') + ' ext=' + ((Get-ExtInstalled $root) -join ',') + ' compat=' + ((Get-CompatInstalled $root) -join ',') + $(if ($reset.Count) { ' skipped=' + ($reset -join ',') } else { '' }))
    exit 0
}

# ---------------------------------------------------------------------------
#  画面 (v0.13 ELSB: 名前の見出し、体・頭・場面のまとまり、画像の一覧で選ぶ、変更の印、MOD 管理)
# ---------------------------------------------------------------------------
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
trap {
    if (-not ('System.Windows.Forms.MessageBox' -as [type])) { Write-Output ('ERROR ' + $_.ToString() + '  @' + $_.ScriptStackTrace); exit 1 }
    [void][System.Windows.Forms.MessageBox]::Show(($PRODUCT_FULL + ' ' + $TOOL_VER + [Environment]::NewLine + [Environment]::NewLine + $_.ToString() + [Environment]::NewLine + $_.ScriptStackTrace),
        $PRODUCT, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit 1
}
$ini = Read-Ini
if (-not $Shot) { Write-Ini $ini }
if ($ini['lang'] -and $UI.ContainsKey($ini['lang'])) { $script:lang = $ini['lang'] }
$script:extHidden = @(([string]$ini['ext_hidden']).Split('|') | Where-Object { $_ })      # v1.1 (10-02 夜): 選択肢に出さない取り込んだ MOD (MOD 管理のチェックを外した物)
function Set-ExtHidden($name, $hide) {
    $script:extHidden = @(@($script:extHidden) | Where-Object { $_ -ne [string]$name })
    if ($hide) { $script:extHidden += [string]$name }
    if (-not $script:noSave) { $ini['ext_hidden'] = (@($script:extHidden) -join '|'); Write-Ini $ini }
}
if ($ShotLang -and $UI.ContainsKey($ShotLang)) { $script:lang = $ShotLang }
if (Test-InsidePaks) { [void][System.Windows.Forms.MessageBox]::Show((T 'msgInsidePaks'), $PRODUCT, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning); exit 1 }

function RGB($r, $g, $b) { return [System.Drawing.Color]::FromArgb($r, $g, $b) }
# v1.0: ロゴのローズ (中心 #E1528C → 縁 #7D1648) に合わせた色。背景は黒に近い赤紫、見出し・選択・変更の印はローズ ($C_GOLD は名前だけ前のまま = 見出しの文字の色)
$C_BG = RGB 24 15 21; $C_PANEL = RGB 48 29 41; $C_PANEL2 = RGB 36 22 31; $C_LINE = RGB 96 52 78
$C_TEXT = RGB 246 236 242; $C_DIM = RGB 184 156 172; $C_OK = RGB 140 214 158; $C_WARN = RGB 255 138 128
$C_ACC = RGB 200 56 120; $C_GOLD = RGB 255 140 186; $C_SEL = RGB 122 36 80; $C_CHG = RGB 150 38 92; $C_CHGT = RGB 255 212 230; $C_DEV = RGB 92 66 150
$C_HEAD = RGB 176 40 104; $C_ROSE = RGB 255 111 168; $C_ACC_HI = RGB 226 80 146; $C_PANEL_HI = RGB 70 42 58; $C_HEADTXT = RGB 255 222 236
$F_BASE = New-Object System.Drawing.Font('Segoe UI', 10)
$F_SMALL = New-Object System.Drawing.Font('Segoe UI', 9)
$F_TINY = New-Object System.Drawing.Font('Segoe UI', 8.5)
$F_TITLE = New-Object System.Drawing.Font('Segoe UI Semibold', 20)
$F_SUB = New-Object System.Drawing.Font('Segoe UI', 12)
$F_SEC = New-Object System.Drawing.Font('Segoe UI Semibold', 10)

$form = New-Object System.Windows.Forms.Form
$form.ClientSize = New-Object System.Drawing.Size(1700, 1340)      # v1.1 (10-02 本人): 1280x800 → 1700x1340。前の大きさが設定に無いとき (初めて開くとき) の大きさ。画面より大きければ Place-Form で縮める
$form.StartPosition = 'Manual'; $form.FormBorderStyle = 'Sizable'; $form.MaximizeBox = $true
$form.MinimumSize = New-Object System.Drawing.Size(1100, 880)      # v1.1 (10-02): 740 → 880 (外側)。取り込みで増える行 (性器・肌) があってもコーエン・マラトの列が収まる高さ
$form.BackColor = $C_BG; $form.ForeColor = $C_TEXT; $form.Font = $F_BASE; $form.AllowDrop = $true
$tip = New-Object System.Windows.Forms.ToolTip
function New-Label($text, $col, $font) {
    $l = New-Object System.Windows.Forms.Label
    $l.Text = $text; $l.ForeColor = $col; $l.UseMnemonic = $false; $l.AutoSize = $false; $l.BackColor = [System.Drawing.Color]::Transparent
    if ($font) { $l.Font = $font }
    return $l
}
function New-Button($text, $bg) {
    $b = New-Object System.Windows.Forms.Button
    $b.Text = $text; $b.FlatStyle = 'Flat'; $b.BackColor = $bg; $b.ForeColor = $C_TEXT; $b.UseMnemonic = $false; $b.FlatAppearance.BorderColor = $C_LINE
    $b.Cursor = [System.Windows.Forms.Cursors]::Hand
    if ($bg -eq $C_ACC) { $b.FlatAppearance.BorderColor = $C_ACC_HI; $b.FlatAppearance.MouseOverBackColor = $C_ACC_HI; $b.FlatAppearance.MouseDownBackColor = $C_ROSE; $b.ForeColor = [System.Drawing.Color]::White }
    else { $b.FlatAppearance.MouseOverBackColor = $C_PANEL_HI; $b.FlatAppearance.MouseDownBackColor = $C_SEL }
    return $b
}
function Set-Box($c, $x, $y, $w, $h) { $c.SetBounds([int]$x, [int]$y, [int][math]::Max(1, $w), [int][math]::Max(1, $h)) }
function Text-W($t, $f) { return [System.Windows.Forms.TextRenderer]::MeasureText([string]$t, $f, (New-Object System.Drawing.Size(4000, 200)), [System.Windows.Forms.TextFormatFlags]::NoPrefix).Width }

# ---- 見出しの帯 (v1.0: ロゴの背景のグラデ + 塗りのハートのロゴ)・ゲームのフォルダ ----
#   画像は ELSB.ps1 の横の assets。無くても動く (帯は同じ色の塗り、ロゴの代わりに ELSB の文字)
$ASSET_DIR = Join-Path $PSScriptRoot 'assets'
function Read-Asset($name) {
    $p = Join-Path $ASSET_DIR $name; $img = $null
    if (-not (Test-Path -LiteralPath $p)) { return $null }
    try { $fs = [IO.File]::OpenRead($p); try { $tmp = [System.Drawing.Image]::FromStream($fs); $img = New-Object System.Drawing.Bitmap($tmp); $tmp.Dispose() } finally { $fs.Close() } } catch { $img = $null }
    return $img
}
function Scale-Bitmap($src, $w, $h) {
    $bmp = New-Object System.Drawing.Bitmap([int][math]::Max(1, $w), [int][math]::Max(1, $h))
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic; $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.DrawImage($src, 0, 0, $bmp.Width, $bmp.Height); $g.Dispose()
    return $bmp
}
function Get-UxTheme {
    # uxtheme の SetWindowTheme を呼ぶ型を Reflection.Emit で作る (Add-Type は C# のコンパイルで起動が遅くなるので使わない)
    if ($null -ne $script:uxType) { return $script:uxType }
    $script:uxType = $false
    try {
        $asm = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ElsbNative')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run)
        $tb = $asm.DefineDynamicModule('ElsbNative').DefineType('ElsbUx', [System.Reflection.TypeAttributes]'Public, Class')
        $m = $tb.DefinePInvokeMethod('SetWindowTheme', 'uxtheme.dll', [System.Reflection.MethodAttributes]'Public, Static, PinvokeImpl',
            [System.Reflection.CallingConventions]::Standard, [int], [Type[]]@([IntPtr], [string], [string]),
            [System.Runtime.InteropServices.CallingConvention]::Winapi, [System.Runtime.InteropServices.CharSet]::Unicode)
        $m.SetImplementationFlags([System.Reflection.MethodImplAttributes]::PreserveSig)
        $script:uxType = $tb.CreateType()
    } catch { $script:uxType = $false }
    return $script:uxType
}
function Set-DarkTheme($ctl, $cls) {
    # Windows 10 1809 以降の暗いスクロールバー・ドロップダウン。古い Windows では何も変わらない (失敗しても止めない)
    $t = Get-UxTheme; if (-not $t) { return }
    try { [void]$t::SetWindowTheme($ctl.Handle, $cls, [System.Management.Automation.Language.NullString]::Value) } catch { }
}
function Apply-DarkParts {
    foreach ($lp in $LEFTS.Values) { Set-DarkTheme $lp 'DarkMode_Explorer' }
    foreach ($pv in $PANES.Values) { Set-DarkTheme $pv.flow 'DarkMode_Explorer' }
    Set-DarkTheme $lvMods 'DarkMode_Explorer'; Set-DarkTheme $txtModDetail 'DarkMode_Explorer'; Set-DarkTheme $txtModFiles 'DarkMode_Explorer'
    foreach ($rw in $rows.Values) { Set-DarkTheme $rw.cmb 'DarkMode_CFD' }
    Set-DarkTheme $cmbLang 'DarkMode_CFD'; Set-DarkTheme $cmbModItem 'DarkMode_CFD'
}
$HEAD_H = 72
$IMG_HEAD_BG = Read-Asset 'elsb_header_bg.jpg'; $IMG_LOGO = Read-Asset 'elsb_logo.png'; $IMG_ICON = Read-Asset 'elsb_icon.png'
if ($IMG_ICON) { try { $script:iconBmp = Scale-Bitmap $IMG_ICON 32 32; $form.Icon = [System.Drawing.Icon]::FromHandle($script:iconBmp.GetHicon()) } catch { } }
$pnlHead = New-Object System.Windows.Forms.Panel; $pnlHead.BackColor = $C_HEAD; $pnlHead.BackgroundImageLayout = 'None'
$picLogo = New-Object System.Windows.Forms.PictureBox; $picLogo.BackColor = [System.Drawing.Color]::Transparent; $picLogo.SizeMode = 'CenterImage'; $picLogo.Visible = [bool]$IMG_LOGO
$script:headKey = ''
function Render-Head {
    # 帯の背景は画像を帯の大きさに合わせて中央で切り取る (縦横比を保つ)。大きさが変わったときだけ作り直す
    $w = $pnlHead.Width; $h = $pnlHead.Height
    if ($w -lt 10 -or $h -lt 10 -or $script:headKey -eq ($w.ToString() + 'x' + $h)) { return }
    $script:headKey = $w.ToString() + 'x' + $h
    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic; $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    if ($IMG_HEAD_BG) {
        $sw = $IMG_HEAD_BG.Width; $sh = $IMG_HEAD_BG.Height
        $s = [math]::Max($w / $sw, $h / $sh); $cwid = $w / $s; $chei = $h / $s
        $src = New-Object System.Drawing.RectangleF((($sw - $cwid) / 2), (($sh - $chei) / 2), $cwid, $chei)
        $g.DrawImage($IMG_HEAD_BG, (New-Object System.Drawing.RectangleF(0, 0, $w, $h)), $src, [System.Drawing.GraphicsUnit]::Pixel)
    } else { $g.Clear($C_HEAD) }
    $pn = New-Object System.Drawing.Pen((RGB 90 18 52), 1); $g.DrawLine($pn, 0, ($h - 1), $w, ($h - 1)); $pn.Dispose()
    $g.Dispose()
    $old = $pnlHead.BackgroundImage; $pnlHead.BackgroundImage = $bmp; if ($old) { $old.Dispose() }
    if ($IMG_LOGO -and -not $picLogo.Image) { $ls = $h - 6; $picLogo.Image = Scale-Bitmap $IMG_LOGO $ls $ls }
}
$lblTitle = New-Label $PRODUCT ([System.Drawing.Color]::White) $F_TITLE; $lblTitle.AutoSize = $true; $lblTitle.Visible = (-not $IMG_LOGO)
$lblSub = New-Label $PRODUCT_SUB ([System.Drawing.Color]::White) (New-Object System.Drawing.Font('Segoe UI Semibold', 16)); $lblSub.AutoSize = $true
$lblVer = New-Label $TOOL_VER $C_HEADTXT $F_SMALL; $lblVer.AutoSize = $true
$lblDev = New-Label 'DEV' $C_TEXT $F_SMALL; $lblDev.BackColor = $C_DEV; $lblDev.TextAlign = 'MiddleCenter'; $lblDev.Visible = $IS_DEV
$lblTag = New-Label '' $C_HEADTXT (New-Object System.Drawing.Font('Segoe UI', 10))
$cmbLang = New-Object System.Windows.Forms.ComboBox
$cmbLang.DropDownStyle = 'DropDownList'; $cmbLang.FlatStyle = 'Flat'; $cmbLang.BackColor = $C_PANEL; $cmbLang.ForeColor = $C_TEXT
[void]$cmbLang.Items.Add('日本語'); [void]$cmbLang.Items.Add('English')
$cmbLang.SelectedIndex = $(if ($script:lang -eq 'ja') { 0 } else { 1 })
$lblGameCap = New-Label '' $C_DIM $F_BASE; $lblGameCap.TextAlign = 'MiddleLeft'
$txtGame = New-Object System.Windows.Forms.TextBox
$txtGame.ReadOnly = $true; $txtGame.BackColor = $C_PANEL; $txtGame.ForeColor = $C_TEXT; $txtGame.BorderStyle = 'FixedSingle'
$btnBrowse = New-Button '' $C_PANEL
$lblStVal = New-Label '' $C_TEXT $F_SMALL
$tabs = New-Object System.Windows.Forms.TabControl
$tabs.Font = $F_BASE; $tabs.Padding = New-Object System.Drawing.Point(18, 6)
$tabCoen = New-Object System.Windows.Forms.TabPage; $tabAnca = New-Object System.Windows.Forms.TabPage
$tabLacra = New-Object System.Windows.Forms.TabPage; $tabMarat = New-Object System.Windows.Forms.TabPage; $tabMods = New-Object System.Windows.Forms.TabPage
foreach ($tpg in @($tabCoen, $tabAnca, $tabLacra, $tabMarat, $tabMods)) { $tpg.BackColor = $C_BG; $tpg.ForeColor = $C_TEXT; $tabs.TabPages.Add($tpg) }
# v1.0: 白い枠の標準のタブをやめ、自前の見出し (選んだタブにローズの下線) に。ページの切り替えは今までどおり $tabs
$tabs.Appearance = 'FlatButtons'; $tabs.SizeMode = 'Fixed'; $tabs.ItemSize = New-Object System.Drawing.Size(0, 1)
$F_TAB = New-Object System.Drawing.Font('Segoe UI', 11); $F_TAB_SEL = New-Object System.Drawing.Font('Segoe UI Semibold', 11)
$pnlTabStrip = New-Object System.Windows.Forms.Panel; $pnlTabStrip.BackColor = $C_BG
$TABBTNS = @()
for ($ti = 0; $ti -lt $tabs.TabPages.Count; $ti++) {
    $tbl = New-Label '' $C_DIM $F_TAB; $tbl.TextAlign = 'MiddleCenter'; $tbl.Cursor = [System.Windows.Forms.Cursors]::Hand; $tbl.Tag = $ti
    $tbl.Add_Click({ param($s, $e2) $tabs.SelectedIndex = [int]$s.Tag })
    $tbl.Add_MouseEnter({ param($s, $e2) if ([int]$s.Tag -ne $tabs.SelectedIndex) { $s.ForeColor = $C_TEXT; $s.BackColor = $C_PANEL2 } })
    $tbl.Add_MouseLeave({ param($s, $e2) Update-TabStrip })
    $pnlTabStrip.Controls.Add($tbl); $TABBTNS += $tbl
}
$tabUnder = New-Object System.Windows.Forms.Panel; $tabUnder.BackColor = $C_ROSE
$tabLine = New-Object System.Windows.Forms.Panel; $tabLine.BackColor = $C_LINE
$pnlTabStrip.Controls.AddRange(@($tabUnder, $tabLine)); $tabUnder.BringToFront()
# タブの白い枠を見せない: $tabs を一回り小さい入れ物 ($pnlPages) に入れ、枠の分だけ外へずらして隠す (ページの中身の位置は今までどおり)
$pnlPages = New-Object System.Windows.Forms.Panel; $pnlPages.BackColor = $C_BG
$pnlPages.Controls.Add($tabs)
$script:tabInset = $null
function Update-TabStrip {
    for ($i = 0; $i -lt $TABBTNS.Count; $i++) {
        $tb = $TABBTNS[$i]; $tb.Text = $tabs.TabPages[$i].Text
        if ($i -eq $tabs.SelectedIndex) { $tb.ForeColor = [System.Drawing.Color]::White; $tb.Font = $F_TAB_SEL; $tb.BackColor = $C_PANEL }
        else { $tb.ForeColor = $C_DIM; $tb.Font = $F_TAB; $tb.BackColor = $C_BG }
    }
    Layout-TabStrip
}
function Layout-TabStrip {
    $x = 0; $h = $pnlTabStrip.Height
    if ($h -lt 10) { return }
    foreach ($tb in $TABBTNS) { $w = [int](Text-W $tb.Text $F_TAB_SEL) + 44; Set-Box $tb $x 0 $w ($h - 4); $x += $w + 2 }
    $sel = $TABBTNS[[math]::Max(0, $tabs.SelectedIndex)]
    Set-Box $tabUnder $sel.Left ($h - 4) $sel.Width 3
    Set-Box $tabLine 0 ($h - 1) $pnlTabStrip.Width 1
}
$TABPAGES = @{ coen = $tabCoen; anca = $tabAnca; lacra = $tabLacra; marat = $tabMarat }
$CHAR_TABS = @('coen') + $PARTNER_TABS
$lblChanges = New-Label '' $C_DIM $F_BASE; $lblChanges.TextAlign = 'MiddleLeft'; $lblChanges.AutoEllipsis = $true
$btnRevert = New-Button '' $C_PANEL; $btnRemove = New-Button '' $C_PANEL; $btnApply = New-Button '' $C_ACC; $btnClose = New-Button '' $C_PANEL
$btnApply.Font = New-Object System.Drawing.Font('Segoe UI Semibold', 10)
$lblMsg = New-Label '' $C_OK $F_SMALL; $lblMsg.AutoEllipsis = $true
$pnlHead.Controls.AddRange(@($picLogo, $lblTitle, $lblSub, $lblVer, $lblDev, $lblTag, $cmbLang))
$form.Controls.AddRange(@($pnlHead, $lblGameCap, $txtGame, $btnBrowse, $lblStVal, $pnlTabStrip, $pnlPages, $lblChanges, $btnRevert, $btnRemove, $btnApply, $btnClose, $lblMsg))

# ---- 見本の画像 (読み込みは 1 回、ファイルは掴まない)。一覧・ドロップダウン用の小さい画像は正面 (左半分)、頭の項目は上の正方形 ----
$script:imgCache = @{}
$script:fullOrder = New-Object System.Collections.Generic.List[string]
$script:noThumb = @{}          # 見本の無い選択肢 (ドロップダウンを描くたびにファイルを探さない)
function Read-ImageFile($p) {
    $img = $null
    try { $fs = [IO.File]::OpenRead($p); try { $tmp = [System.Drawing.Image]::FromStream($fs); $img = New-Object System.Drawing.Bitmap($tmp); $tmp.Dispose() } finally { $fs.Close() } } catch { $img = $null }
    return $img
}
function Test-ImageShown($img) { if (-not $img) { return $false }; foreach ($pv in $PANES.Values) { if ([object]::ReferenceEquals($pv.pic.Image, $img)) { return $true } }; return $false }
function Drop-Image($key) {
    if (-not $script:imgCache.ContainsKey($key)) { return }
    $im = $script:imgCache[$key]; [void]$script:imgCache.Remove($key); [void]$script:fullOrder.Remove($key)
    if ($key.StartsWith('full|') -and $im -and -not (Test-ImageShown $im)) { $im.Dispose() }      # 小さい画像は一覧のタイルが使っているかもしれないので捨てるだけ
}
function Forget-Images($p) {
    # 見本を差し替えた ($p)・読み直した (全部): 覚えた画像を捨てる
    foreach ($k in @($script:imgCache.Keys)) { if (-not $p -or $k.EndsWith('|' + $p)) { Drop-Image $k } }
    if ($p) { [void]$script:noThumb.Remove($p) } else { $script:noThumb = @{} }
}
function Load-Image($p) {
    # 大きい見本 (ファイルは掴まない)。覚えるのは最近の 6 枚だけ (全部覚えると一覧を開くたびにメモリが増え続けた)
    if (-not $p) { return $null }
    $key = 'full|' + $p
    if ($script:imgCache.ContainsKey($key)) { [void]$script:fullOrder.Remove($key); $script:fullOrder.Add($key); return $script:imgCache[$key] }
    if (-not (Test-Path -LiteralPath $p)) { return $null }
    $img = Read-ImageFile $p
    if (-not $img) { return $null }
    $script:imgCache[$key] = $img; $script:fullOrder.Add($key)
    while ($script:fullOrder.Count -gt 6) { Drop-Image $script:fullOrder[0] }
    return $img
}
function Get-Thumb($kindKey, $o, $w, $h) {
    # 一覧・ドロップダウン用の小さい画像は正面 (左半分)、頭の項目は上の正方形。作るときに読んだ元の画像は覚えない
    $p = Preview-Path $kindKey $o
    if (-not $p) { return $null }
    $key = 'th|' + $w + 'x' + $h + '|' + $p
    if ($script:imgCache.ContainsKey($key)) { return $script:imgCache[$key] }
    if ($script:noThumb.ContainsKey($p)) { return $null }
    if (-not (Test-Path -LiteralPath $p)) { $script:noThumb[$p] = $true; return $null }
    $fk = 'full|' + $p; $own = $false
    if ($script:imgCache.ContainsKey($fk)) { $src = $script:imgCache[$fk] } else { $src = Read-ImageFile $p; $own = $true }
    if (-not $src) { return $null }
    $kd = $KIND_BY_KEY[[string]$kindKey]
    $sw = $src.Width; $sh = $src.Height
    if (-not ([string]$o).StartsWith('ext:') -and $sw -ge 400) { $sw = [int]($sw / 2) }       # 道具の見本は正面と横 (後ろ) が横に並ぶ → 左 (正面)
    if ($kd.sec -eq 'head' -and $sh -gt $sw) { $sh = $sw }                                     # 頭の項目は上の正方形 (頭)
    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic; $g.Clear($C_PANEL2)
    $sc = [math]::Min($w / $sw, $h / $sh); $dw = [int]($sw * $sc); $dh = [int]($sh * $sc)
    $g.DrawImage($src, (New-Object System.Drawing.Rectangle([int](($w - $dw) / 2), [int](($h - $dh) / 2), $dw, $dh)), (New-Object System.Drawing.Rectangle(0, 0, $sw, $sh)), [System.Drawing.GraphicsUnit]::Pixel)
    $g.Dispose()
    if ($own) { $src.Dispose() }
    $script:imgCache[$key] = $bmp
    return $bmp
}
$SWATCH = @{
    '01_black' = '#201C1B'; '02_darkbrown' = '#3B281C'; '03_brown' = '#5C3A22'; '04_lightbrown' = '#80593A'; '05_auburn' = '#70301A'; '06_ginger' = '#B8582A'
    '07_darkblonde' = '#9E7C4A'; '08_blonde' = '#CBA65E'; '09_platinum' = '#DED1B0'; '10_saltpepper' = '#8B8885'; '11_white' = '#E9E7E3'
    'red' = '#C0392B'; 'blue' = '#2E6FD8'; 'green' = '#2E9E4F'; 'yellow' = '#D4B72C'; 'orange' = '#E07B24'; 'purple' = '#8E44AD'
}
function Get-Swatch($o) {
    if (-not $o -or ([string]$o).StartsWith('ext:') -or -not $SWATCH.ContainsKey([string]$o)) { return $null }
    return [System.Drawing.ColorTranslator]::FromHtml($SWATCH[[string]$o])
}

# ---- 項目の行 (名前・ドロップダウン・変更の印)。ドロップダウンは小さい画像か色の見本付き ----
function Draw-ComboItem($s, $e2) {
    $g = $e2.Graphics; $b = $e2.Bounds
    $isSel = (($e2.State -band [System.Windows.Forms.DrawItemState]::Selected) -ne 0)
    $isEdit = (($e2.State -band [System.Windows.Forms.DrawItemState]::ComboBoxEdit) -ne 0)
    $bg = $(if (-not $s.Enabled) { $C_PANEL2 } elseif ($isSel -and -not $isEdit) { $C_SEL } else { $C_PANEL })
    $br = New-Object System.Drawing.SolidBrush($bg); $g.FillRectangle($br, $b); $br.Dispose()
    if ($e2.Index -lt 0) { return }
    $r = $rows[[string]$s.Tag]
    $o = $(if ($e2.Index -eq 0) { '' } else { [string]$r.opts[$e2.Index - 1] })
    $x = $b.X + 4
    $swc = Get-Swatch $o
    if ($swc) {
        $sb = New-Object System.Drawing.SolidBrush($swc); $rc = New-Object System.Drawing.Rectangle($x, ($b.Y + [int](($b.Height - 18) / 2)), 28, 18)
        $g.FillRectangle($sb, $rc); $sb.Dispose(); $pn = New-Object System.Drawing.Pen($C_LINE); $g.DrawRectangle($pn, $rc); $pn.Dispose(); $x += 36
    } elseif ($r.pics) {
        # 画像のある項目だけ左に小さい画像の場所を取る (画像の無い項目は詰める)
        $th = Get-Thumb ([string]$s.Tag) $o 36 26
        if ($th) { $g.DrawImage($th, $x, ($b.Y + [int](($b.Height - 26) / 2)), 36, 26) }
        $x += 44
    } else { $x += 4 }
    $available = Test-SharedChoice ([string]$s.Tag) $o (Get-RawSelection)
    $col = $(if ($s.Enabled -and $available) { $C_TEXT } else { $C_DIM })
    $fl = [System.Windows.Forms.TextFormatFlags]'VerticalCenter, Left, EndEllipsis, NoPrefix, SingleLine'
    $txt = [string]$s.Items[$e2.Index]
    if (-not $s.Enabled -and $isEdit -and $r.usedBy) { $txt = [string]::Format((T 'usedBy'), $r.usedBy) }      # 取り込んだ MOD が置き換え中
    [System.Windows.Forms.TextRenderer]::DrawText($g, $txt, $s.Font, (New-Object System.Drawing.Rectangle($x, $b.Y, [math]::Max(10, $b.Right - $x - 2), $b.Height)), $col, $fl)
}
function New-ItemCombo($key) {
    $c = New-Object System.Windows.Forms.ComboBox
    $c.DropDownStyle = 'DropDownList'; $c.FlatStyle = 'Flat'; $c.DrawMode = 'OwnerDrawFixed'; $c.ItemHeight = 30
    $c.BackColor = $C_PANEL; $c.ForeColor = $C_TEXT; $c.MaxDropDownItems = 12; $c.Tag = $key; $c.Font = $F_BASE
    $c.Add_MouseWheel({ param($s, $e2) if (-not $s.DroppedDown) { ([System.Windows.Forms.HandledMouseEventArgs]$e2).Handled = $true } })
    $c.Add_DrawItem({ param($s, $e2) Draw-ComboItem $s $e2 })
    return $c
}
$COMBO_ARROW = @{}
function New-ComboArrow($cmb) {
    # v1.0: Flat のドロップダウンの矢印の欄は .NET がシステムの色 (白) で描くので、暗い矢印のボタンを重ねる (押すと一覧が開く)。置き場所は Place-ComboArrow
    $a = New-Label ([string][char]0x25BE) $C_DIM (New-Object System.Drawing.Font('Segoe UI', 10)); $a.TextAlign = 'MiddleCenter'; $a.BackColor = $C_PANEL
    $a.Cursor = [System.Windows.Forms.Cursors]::Hand; $a.Tag = $cmb
    $a.Add_Click({ param($s, $e2) $cb = $s.Tag; if ($cb.Enabled) { [void]$cb.Focus(); $cb.DroppedDown = $true } })
    $a.Add_MouseEnter({ param($s, $e2) if ($s.Tag.Enabled) { $s.ForeColor = [System.Drawing.Color]::White } })
    $a.Add_MouseLeave({ param($s, $e2) $s.ForeColor = $C_DIM })
    $cmb.Add_EnabledChanged({ param($s, $e2) $ar = $COMBO_ARROW[$s]; if ($ar) { $ar.BackColor = $(if ($s.Enabled) { $C_PANEL } else { $C_PANEL2 }) } })
    $COMBO_ARROW[$cmb] = $a
    return $a
}
function Place-ComboArrow($cmb) {
    $a = $COMBO_ARROW[$cmb]; if (-not $a) { return }
    $w = [System.Windows.Forms.SystemInformation]::VerticalScrollBarWidth + 1
    Set-Box $a ($cmb.Right - $w - 1) ($cmb.Top + 1) $w ($cmb.Height - 2); $a.BringToFront()
}
$LEFTS = @{}      # 左の列 (項目)。窓が低いときは縦にスクロールする
foreach ($tk in $CHAR_TABS) { $lp0 = New-Object System.Windows.Forms.Panel; $lp0.AutoScroll = $true; $lp0.BackColor = $C_BG; $TABPAGES[$tk].Controls.Add($lp0); $LEFTS[$tk] = $lp0 }
$rows = @{}
foreach ($kind in $KINDS) {
    $tp = $LEFTS[$kind.tab]
    $cap = New-Label '' $C_TEXT $F_BASE; $cap.TextAlign = 'MiddleLeft'; $cap.AutoEllipsis = $true; $cap.Tag = $kind.key; $cap.Cursor = 'Hand'
    $cmb = New-ItemCombo $kind.key
    $bad = New-Label '' $C_CHGT $F_SMALL; $bad.BackColor = $C_CHG; $bad.TextAlign = 'MiddleCenter'; $bad.Visible = $false
    $use = New-Label '' $C_DIM $F_SMALL; $use.TextAlign = 'MiddleLeft'; $use.AutoEllipsis = $true; $use.Visible = $false
    $arr = New-ComboArrow $cmb
    $tp.Controls.AddRange(@($cap, $cmb, $bad, $use, $arr))
    $rows[$kind.key] = @{ cap = $cap; cmb = $cmb; bad = $bad; use = $use; arr = $arr; opts = @(); shown = $true; pics = $false; usedBy = '' }     # shown = 並べ方で出している行 (Visible は隠れたタブで false になるので使わない)
}
$SECHEAD = @{}
foreach ($tk in $CHAR_TABS) {
    foreach ($sc in $SECTIONS) {
        $sl = New-Label '' $C_GOLD $F_SEC; $sln = New-Object System.Windows.Forms.Panel; $sln.BackColor = $C_LINE
        $LEFTS[$tk].Controls.AddRange(@($sl, $sln)); $SECHEAD[$tk + '/' + $sc] = @{ lbl = $sl; line = $sln }
    }
}
$NOTES = @{}
foreach ($tk in $PARTNER_TABS) { $nl = New-Label '' $C_DIM $F_SMALL; $LEFTS[$tk].Controls.Add($nl); $NOTES[$tk] = $nl }
# ---- 右: 大きい見本と、選んでいる項目の選択肢の画像の一覧 ----
$PANES = @{}
foreach ($tk in $CHAR_TABS) {
    $pc = New-Object System.Windows.Forms.PictureBox; $pc.SizeMode = 'Zoom'; $pc.BackColor = $C_PANEL2; $pc.BorderStyle = 'FixedSingle'
    $lp = New-Label '' $C_TEXT $F_BASE; $lp.TextAlign = 'MiddleCenter'; $lp.AutoEllipsis = $true
    $lh = New-Label '' $C_DIM $F_TINY; $lh.TextAlign = 'MiddleCenter'; $lh.AutoEllipsis = $true
    $lg = New-Label '' $C_GOLD $F_SEC; $lg.TextAlign = 'MiddleLeft'; $lg.AutoEllipsis = $true
    $lgh = New-Label '' $C_DIM $F_TINY; $lgh.TextAlign = 'MiddleRight'; $lgh.AutoEllipsis = $true
    $fl = New-Object System.Windows.Forms.FlowLayoutPanel; $fl.AutoScroll = $true; $fl.BackColor = $C_PANEL2; $fl.WrapContents = $true; $fl.Padding = New-Object System.Windows.Forms.Padding(4)
    $TABPAGES[$tk].Controls.AddRange(@($pc, $lp, $lh, $lg, $lgh, $fl))
    $PANES[$tk] = @{ pic = $pc; lbl = $lp; hint = $lh; gcap = $lg; ghint = $lgh; flow = $fl; focus = '' }
}
# ---- MOD 管理 ----
# v1.1 (10-02 夜 本人「文字は文体を変えず、大きさを少し日本語も英語も上げて。10 から 11」): MOD 管理の字は 1 段大きく (名前 11・小さい字 10・題 12)
$F_MODTXT = New-Object System.Drawing.Font('Segoe UI', 10)
$F_MODNAME = New-Object System.Drawing.Font('Segoe UI Semibold', 11)
$lblModsHint = New-Label '' $C_DIM $F_MODTXT
$btnModAdd = New-Button '' $C_PANEL; $btnModOpen = New-Button '' $C_PANEL; $btnModRescan = New-Button '' $C_PANEL
$lvMods = New-Object System.Windows.Forms.ListView
$lvMods.View = 'Details'; $lvMods.CheckBoxes = $true; $lvMods.FullRowSelect = $true; $lvMods.HideSelection = $false; $lvMods.MultiSelect = $false
$lvMods.BackColor = $C_PANEL; $lvMods.ForeColor = $C_TEXT; $lvMods.BorderStyle = 'FixedSingle'; $lvMods.OwnerDraw = $true; $lvMods.Font = $F_BASE
# v1.1 (10-02 夜 本人「見切れてしまって文字が読めない。もっとユーザーフレンドリーな UI に」): 一覧は窓の幅いっぱいの 1 列、1 件 2 行
#   (1 行目 = 名前と右端の ELSB の表記、2 行目 = 対象・場所・ぶつかる相手の数)。名前は省略せず折り返す (長い名前があれば全部の行を名前 2 行の高さに)。見出しは無し
$lvMods.HeaderStyle = 'None'
$lvMods.ShowItemToolTips = $true
$script:modLineH1 = [System.Windows.Forms.TextRenderer]::MeasureText('Ag', $F_MODNAME).Height
$script:modLineH2 = [System.Windows.Forms.TextRenderer]::MeasureText('Ag', $F_MODTXT).Height
$script:modNameLines = 1
function Mod-RowH($lines) { return [int]($script:modLineH1 * $lines + $script:modLineH2 + 14) }
$ilRow = New-Object System.Windows.Forms.ImageList; $ilRow.ImageSize = New-Object System.Drawing.Size(1, (Mod-RowH 1)); $lvMods.SmallImageList = $ilRow     # 行の高さ
$script:modRowInfo = @{}      # MOD の id → @{ info = 2 行目; chip = 2 行目のマーク (併用 OK など); ckind = マークの色; badge = ELSB の表記; bkind = 表記の色; subj; where }
$script:compatInst = @()      # ~mods に置かれている互換の id (表記の「適用済」)
$script:modLost = @{}         # v1.1 (10-02 夜): MOD の id → ほかの方が使われるファイルの数 (Get-ModConflicts が作る、一覧のマーク)
# ELSB の表記の色 (今の道具の暗い地に合わせる): 適用済 = 緑、未適用 = 黄、使えない = 赤、互換があるだけ (MOD を使っていない) = 灰
$C_BADGE = @{ ok = @((RGB 34 66 46), $C_OK); wait = @((RGB 76 58 26), (RGB 255 206 132)); bad = @((RGB 84 30 38), $C_WARN); none = @($C_PANEL2, $C_DIM) }
$C_DIM2 = RGB 210 188 200      # 2 行目の字 (10-02 夜: 少し明るく)
function Draw-ModCell($s, $e2) {
    # 行は自分で描く (既定の選択色は暗い画面で白く浮く)。チェックは元の場所 (押すと切り替わる所) に描く
    if ($e2.ColumnIndex -ne 0) { return }
    $g = $e2.Graphics; $b = $e2.Bounds; $it = $e2.Item
    $br = New-Object System.Drawing.SolidBrush($(if ($it.Selected) { $C_SEL } else { $C_PANEL })); $g.FillRectangle($br, $b); $br.Dispose()
    $pn = New-Object System.Drawing.Pen($C_PANEL2); $g.DrawLine($pn, $b.X, ($b.Bottom - 1), $b.Right, ($b.Bottom - 1)); $pn.Dispose()
    $st = $(if ($it.Checked) { [System.Windows.Forms.VisualStyles.CheckBoxState]::CheckedNormal } else { [System.Windows.Forms.VisualStyles.CheckBoxState]::UncheckedNormal })
    $gs = [System.Windows.Forms.CheckBoxRenderer]::GetGlyphSize($g, $st)
    [System.Windows.Forms.CheckBoxRenderer]::DrawCheckBox($g, (New-Object System.Drawing.Point(($b.X + $script:chkX), ($b.Y + [int](($b.Height - $gs.Height) / 2)))), $st)
    $x = $b.X + $script:chkX + $gs.Width + 10; $rx = $b.Right - 8
    $ri = $script:modRowInfo[[string]$it.Tag]
    if ($ri -and $ri.badge) {
        # ELSB の表記は右上 (1 行目の高さ)
        $bw = [System.Windows.Forms.TextRenderer]::MeasureText([string]$ri.badge, $F_MODTXT).Width + 12; $bh = $script:modLineH2 + 4
        $bc = $C_BADGE[[string]$ri.bkind]; if (-not $bc) { $bc = $C_BADGE['none'] }
        $rr = New-Object System.Drawing.Rectangle(($rx - $bw), ($b.Y + 6), $bw, $bh)
        $br = New-Object System.Drawing.SolidBrush($bc[0]); $g.FillRectangle($br, $rr); $br.Dispose()
        [System.Windows.Forms.TextRenderer]::DrawText($g, [string]$ri.badge, $F_MODTXT, $rr, $bc[1], [System.Windows.Forms.TextFormatFlags]'HorizontalCenter, VerticalCenter, NoPrefix, SingleLine')
        $rx = $rx - $bw - 10
    }
    $nh = $script:modLineH1 * $script:modNameLines
    [System.Windows.Forms.TextRenderer]::DrawText($g, [string]$it.Text, $F_MODNAME, (New-Object System.Drawing.Rectangle($x, ($b.Y + 5), [math]::Max(4, $rx - $x), $nh)), $it.ForeColor, [System.Windows.Forms.TextFormatFlags]'Left, Top, WordBreak, NoPrefix, EndEllipsis')
    if ($ri) {
        $y2 = $b.Y + 5 + $nh + 3; $fl = [System.Windows.Forms.TextFormatFlags]'Left, Top, NoPrefix, SingleLine, NoPadding'
        [System.Windows.Forms.TextRenderer]::DrawText($g, [string]$ri.info, $F_MODTXT, (New-Object System.Drawing.Point($x, $y2)), $C_DIM2, $fl)
        if ($ri.chip -or $ri.chip2) {
            # v1.1 (10-02 夜): 2 行目の後ろに印。1 つめ = ELSB との関係 (選んでいなくても出す。併用 OK = 緑 / 一部を置き換える・一部とぶつかる = 黄)、
            #   2 つめ = 今の困りごと (今は一部が使われていない = 黄 / 今は使われていない = 赤)
            $cx = $x + [System.Windows.Forms.TextRenderer]::MeasureText([string]$ri.info, $F_MODTXT, (New-Object System.Drawing.Size(4000, 100)), $fl).Width + 12
            foreach ($cp in @(@([string]$ri.chip, [string]$ri.ckind), @([string]$ri.chip2, [string]$ri.ckind2))) {
                if (-not $cp[0]) { continue }
                $cw = [System.Windows.Forms.TextRenderer]::MeasureText($cp[0], $F_MODTXT, (New-Object System.Drawing.Size(4000, 100)), $fl).Width + 12
                $cc = $C_BADGE[$cp[1]]; if (-not $cc) { $cc = $C_BADGE['none'] }
                $cr = New-Object System.Drawing.Rectangle($cx, ($y2 - 2), $cw, ($script:modLineH2 + 2))
                $br = New-Object System.Drawing.SolidBrush($cc[0]); $g.FillRectangle($br, $cr); $br.Dispose()
                [System.Windows.Forms.TextRenderer]::DrawText($g, $cp[0], $F_MODTXT, $cr, $cc[1], [System.Windows.Forms.TextFormatFlags]'HorizontalCenter, VerticalCenter, NoPrefix, SingleLine')
                $cx += $cw + 8
            }
        }
    }
}
$script:chkX = 3          # 元のチェックの場所 (HitTest の StateImage が x=3..15)
$lvMods.Add_DrawItem({ param($s, $e2) $e2.DrawDefault = $false })
$lvMods.Add_DrawSubItem({ param($s, $e2) Draw-ModCell $s $e2 })
[void]$lvMods.Columns.Add('', 400)
$lblModTitle = New-Label '' $C_TEXT (New-Object System.Drawing.Font('Segoe UI Semibold', 12)); $lblModTitle.AutoEllipsis = $false      # v1.1 (10-02): 長い名前は 2 行に折り返す
$lblModMeta = New-Label '' $C_DIM $F_MODTXT
$lblModItemCap = New-Label '' $C_DIM $F_MODTXT
$cmbModItem = New-Object System.Windows.Forms.ComboBox
$cmbModItem.Font = New-Object System.Drawing.Font('Segoe UI', 11)
$cmbModItem.DropDownStyle = 'DropDownList'; $cmbModItem.FlatStyle = 'Flat'; $cmbModItem.BackColor = $C_PANEL; $cmbModItem.ForeColor = $C_TEXT
$btnModRename = New-Button '' $C_PANEL; $btnModRemove = New-Button '' $C_PANEL
$btnModImport = New-Button '' $C_PANEL; $btnModImport.Visible = $false      # v1.1.1: ~mods の MOD を取り込む
$txtModDetail = New-Object System.Windows.Forms.TextBox
$txtModDetail.Multiline = $true; $txtModDetail.ReadOnly = $true; $txtModDetail.ScrollBars = 'Vertical'; $txtModDetail.WordWrap = $true
$txtModDetail.BackColor = $C_PANEL2; $txtModDetail.ForeColor = $C_TEXT; $txtModDetail.BorderStyle = 'FixedSingle'; $txtModDetail.Font = $F_MODTXT
# v1.1 (10-02): 置き換えるファイルは右の列に分けた (フォルダごと、パスは省略しない)
$lblModFilesCap = New-Label '' $C_DIM $F_MODTXT
$txtModFiles = New-Object System.Windows.Forms.TextBox
$txtModFiles.Multiline = $true; $txtModFiles.ReadOnly = $true; $txtModFiles.ScrollBars = 'Vertical'; $txtModFiles.WordWrap = $true
$txtModFiles.BackColor = $C_PANEL2; $txtModFiles.ForeColor = $C_TEXT; $txtModFiles.BorderStyle = 'FixedSingle'; $txtModFiles.Font = $F_MODTXT
$tabMods.Controls.AddRange(@($lblModsHint, $btnModAdd, $btnModOpen, $btnModRescan, $lvMods, $lblModTitle, $lblModMeta, $lblModItemCap, $cmbModItem, $btnModRename, $btnModRemove, $btnModImport, $txtModDetail, $lblModFilesCap, $txtModFiles))
$arrModItem = New-ComboArrow $cmbModItem; $tabMods.Controls.Add($arrModItem)
$arrLang = New-ComboArrow $cmbLang; $pnlHead.Controls.Add($arrLang)

$script:gameRoot = $null
$script:installed = @{}
$script:extOnPending = @()
$script:modPending = @{}
$script:modEntries = @()
$script:modConf = @{}
$script:syncing = $false
$script:fillingMods = $false
$script:previewKind = ''
$script:capW = 160; $script:comboW = 320
$script:noSave = $false
$script:modIsExt = $false
$script:initDone = $false        # 初期化の間は並べ直さない (最後に 1 回)
$script:modsDirty = $true        # MOD 管理の画面の一覧を作り直す必要がある (タブを開いたときに作る)
$script:shotSmall = $false

# ---- 選択・状態 ----
function Get-ExtByName($n) { return (@(Get-ExtMods) | Where-Object { $_.name -eq $n } | Select-Object -First 1) }
function Get-RawSelection {
    $sel = @{}
    foreach ($kind in $KINDS) { $r = $rows[$kind.key]; $i = $r.cmb.SelectedIndex; $sel[$kind.key] = $(if ($i -le 0) { '' } else { [string]$r.opts[$i - 1] }) }
    return $sel
}
function Get-CompatFrees($e, $raw) {
    # v1.1: 互換が使えるとき (体型など範囲以外の条件を満たす)、取り込んだ MOD が置き換えずに ELSB のまま選べる項目 (範囲)
    $c = Get-CompatFor $e $raw $false
    #   v1.1 (10-02): + keeps (体型・髪など)。Get-CompatFor は範囲 (frees) 以外の requires (体型) を満たすときだけ返すので、keeps も体型が合うときだけ
    if ($c) { return @($c.frees) + @($c.keeps) }
    return @()
}
function Current-Selection {
    # 置く物: 取り込んだ MOD を選んだ項目のほか、その MOD が重なる項目も同じ MOD 扱い (その項目の ELSB の箱は置かない)
    #   v1.1: 互換が使えるときは、互換が勝つ項目 (範囲) は ELSB の選択のまま
    $raw = Get-RawSelection; $sel = Get-RawSelection
    foreach ($kind in $KINDS) {
        $v = [string]$raw[$kind.key]
        if (-not $v.StartsWith('ext:')) { continue }
        $e = Get-ExtByName $v.Substring(4)
        if ($kind.overlay) { continue }      # v1.1 (10-02 分家): 肌・メイク・タトゥの項目の MOD は体型などを置き換えない (ELSB の選択のまま一緒に置く)
        if ($e) { $fr = @(Get-CompatFrees $e $raw); foreach ($k2 in $e.kinds) { if ($k2 -ne $kind.key -and $sel.ContainsKey($k2) -and $fr -notcontains $k2) { $sel[$k2] = $v } } }
    }
    return $sel
}
function Get-UsedBy {
    $raw = Get-RawSelection; $u = @{}
    foreach ($kind in $KINDS) {
        $v = [string]$raw[$kind.key]
        if (-not $v.StartsWith('ext:')) { continue }
        $e = Get-ExtByName $v.Substring(4)
        if ($kind.overlay) { continue }      # v1.1 (10-02 分家): 肌の項目の MOD は重なる項目を「置き換え中」にしない
        if ($e) {
            # v1.1 (10-02): 互換の条件の項目 (体型など) は、互換が使えないときも選べるまま (Thicc Lacra は体型にも重なる。体型を ELSB にすれば互換が使える)。
            #   置く物 (Current-Selection) は今までどおり MOD 扱い (ELSB の体型の箱は置かない = 選択がバニラのときと同じ)
            $fr = @(Get-CompatFrees $e $raw); $rq = @()
            foreach ($c in @(Get-CompatMods)) { $s = Get-CompatSource $c; if ($s -and $s.name -eq $e.name -and (Test-CompatWins $c $e)) { foreach ($r in $c.requires) { if ($c.frees -notcontains $r.item) { $rq += $r.item } } } }      # 範囲 (frees) は今までどおり
            foreach ($k2 in $e.kinds) { if ($k2 -ne $kind.key -and $fr -notcontains $k2 -and $rq -notcontains $k2) { $u[$k2] = $e.name } }
        }
    }
    return $u
}
function Kind-Of($key) { return $KIND_BY_KEY[[string]$key] }
function Refresh-States {
    Normalize-SharedControls
    # 取り込んだ MOD が置き換える項目は選べなくし、適用前 (今の状態) と違う項目に「変更」の印。下に変更の件数と中身
    $u = Get-UsedBy; $raw = Get-RawSelection; $changed = @()
    $script:syncing = $true
    try {
        foreach ($kind in $KINDS) {
            $r = $rows[$kind.key]; $ub = [string]$u[$kind.key]
            if ($ub) {
                if ($r.cmb.SelectedIndex -ne 0) { $r.cmb.SelectedIndex = 0 }
                $r.cmb.Enabled = $false; $r.bad.Visible = $false
                $r.usedBy = $ub; $r.use.Visible = $false; $tip.SetToolTip($r.cmb, [string]::Format((T 'usedBy'), $ub)); $r.cmb.Invalidate()
                continue
            }
            $r.usedBy = ''; $r.cmb.Enabled = $true; $r.use.Visible = $false; $tip.SetToolTip($r.cmb, '')
            $inst = [string]$script:installed[$kind.key]
            if ($inst.StartsWith('ext:')) { $ie = Get-ExtByName $inst.Substring(4); if (-not $ie -or $ie.main -ne $kind.key) { $inst = '' } }
            $cur = [string]$raw[$kind.key]
            $ch = ($cur -ne $inst)
            $r.bad.Visible = ($ch -and [bool]$r.shown)
            if ($ch) {
                $changed += (T $kind.key)
                $iname = $(if ($inst -eq '?') { '?' } elseif ($inst) { Option-Name $kind.key $inst } else { First-Label $kind.key })
                $tip.SetToolTip($r.bad, (T 'nowTip') + $iname)
            }
        }
    } finally { $script:syncing = $false }
    foreach ($m in $script:modEntries) {
        $want = Get-ModDesired $m
        if ($m.type -eq 'ext') { if ($m.ext.main) { continue }; if ($want -ne [bool]$m.on) { $changed += [string]::Format($(if ($want) { (T 'chModOn') } else { (T 'chModOff') }), $m.name) }; continue }
        if ($want -ne [bool]$m.on) { $changed += [string]::Format($(if ($want) { (T 'chModOn') } else { (T 'chModOff') }), $m.name) }
    }
    if ($changed.Count -gt 0) { $lblChanges.Text = [string]::Format((T 'changesN'), $changed.Count, ($changed -join ', ')); $lblChanges.ForeColor = $C_CHGT }
    else { $lblChanges.Text = (T 'noChanges'); $lblChanges.ForeColor = $C_DIM }
    $tip.SetToolTip($lblChanges, $lblChanges.Text)
    foreach ($tk in $CHAR_TABS) { Mark-Gallery $tk }
}
function Fill-Combos {
    # 選択肢を作り直す (取り込んだ MOD の増減・言語の切り替え)。今の選択は値で覚えて戻す
    $script:syncing = $true
    try {
        foreach ($kind in $KINDS) {
            $r = $rows[$kind.key]; $i = $r.cmb.SelectedIndex
            $keep = $(if ($i -gt 0 -and ($i - 1) -lt @($r.opts).Count) { [string]$r.opts[$i - 1] } else { '' })
            $r.opts = @(Get-OptionList $kind)
            $r.cmb.BeginUpdate(); $r.cmb.Items.Clear()
            [void]$r.cmb.Items.Add((First-Label $kind.key))
            foreach ($o in $r.opts) { [void]$r.cmb.Items.Add((Option-Name $kind.key $o)) }
            $r.cmb.EndUpdate()
            $r.pics = $false
            foreach ($o in @('') + @($r.opts)) { $pp = Preview-Path $kind.key $o; if ($pp -and (Test-Path -LiteralPath $pp)) { $r.pics = $true; break } }
            $idx = 0; if ($keep) { $j = [array]::IndexOf(@($r.opts), $keep); if ($j -ge 0) { $idx = $j + 1 } }
            $r.cmb.SelectedIndex = $idx
        }
    } finally { $script:syncing = $false }
    Measure-Widths
    foreach ($tk in $CHAR_TABS) { $PANES[$tk].dirty = $true }; Ensure-TabView      # 選択肢が変わった: 画像の一覧は見えるタブだけ作り直す
}
function Measure-Widths {
    # 名前とドロップダウンの幅は、今の言語の一番長い文字に合わせる (見切れないように)
    $cmax = 0; $omax = 0
    foreach ($kind in $KINDS) {
        $w = Text-W (T $kind.key) $F_BASE; if ($w -gt $cmax) { $cmax = $w }
        foreach ($it in $rows[$kind.key].cmb.Items) { $w2 = Text-W ([string]$it) $F_BASE; if ($w2 -gt $omax) { $omax = $w2 } }
    }
    $script:capW = [int][math]::Min(280, [math]::Max(130, $cmax + 14))
    $script:comboW = [int][math]::Min(480, [math]::Max(260, $omax + 44 + 36))
}

# ---- 見本と画像の一覧 ----
function Show-Preview($kindKey, $idx = -1) {
    $kind = Kind-Of $kindKey
    if (-not $kind) { return }
    $pn = $PANES[$kind.tab]; $r = $rows[$kindKey]
    $i = $(if ($idx -ge 0) { $idx } else { $r.cmb.SelectedIndex })
    if ($i -lt 0) { $i = 0 }
    $o = $(if ($i -le 0) { '' } else { [string]$r.opts[$i - 1] })
    $img = Load-Image (Preview-Path $kindKey $o)
    $cap = (T $kindKey) + ': ' + [string]$r.cmb.Items[$i]
    if (-not $img -and $kind.fallback) {
        # 体の場面・服は見本が無ければ体型の見本を出す
        $fr = $rows[$kind.fallback]; $fi = $fr.cmb.SelectedIndex; $fo = $(if ($fi -le 0) { '' } else { [string]$fr.opts[$fi - 1] })
        $img = Load-Image (Preview-Path $kind.fallback $fo)
        if ($img) { $cap += '  (' + (T $kind.fallback) + ': ' + [string]$fr.cmb.Items[[math]::Max(0, $fi)] + ')' }
    }
    if (-not $img) { $cap += '  (' + (T 'noPreview') + ')' }
    $pn.pic.Image = $img
    $description = Get-SharedDescription $kindKey $o
    $pn.lbl.Text = $cap; $tip.SetToolTip($pn.lbl, ($cap + [Environment]::NewLine + $description))
    $tip.SetToolTip($pn.pic, $description)
    $pn.hint.Text = $description; $tip.SetToolTip($pn.hint, $description)
    if ($idx -lt 0) { $script:previewKind = $kindKey }
}
function Set-Focus($kindKey) {
    # 右の一覧に出す項目を替える (ドロップダウンを触った・名前を押した)
    $kind = Kind-Of $kindKey
    if (-not $kind) { return }
    $pn = $PANES[$kind.tab]
    if ($pn.focus -ne $kindKey) { $pn.focus = $kindKey; Fill-Gallery $kind.tab }
    Show-Preview $kindKey
}
function Fill-Gallery($tk) {
    $pn = $PANES[$tk]; $key = $pn.focus; $fl = $pn.flow
    $fl.SuspendLayout()
    foreach ($ctl in @($fl.Controls)) { $ctl.Dispose() }
    $fl.Controls.Clear()
    if (-not $key) { $pn.gcap.Text = ''; $fl.ResumeLayout(); return }
    $kd = Kind-Of $key; $r = $rows[$key]; $n = $r.cmb.Items.Count
    $pn.gcap.Text = [string]::Format((T 'galleryCap'), (T $key), $n); $tip.SetToolTip($pn.gcap, $pn.gcap.Text + [Environment]::NewLine + (T 'galleryHint'))
    $head = ($kd.sec -eq 'head')
    $tw = $(if ($head) { 128 } else { 112 }); $ih = $(if ($head) { 96 } else { 168 })
    for ($i = 0; $i -lt $n; $i++) {
        $o = $(if ($i -eq 0) { '' } else { [string]$r.opts[$i - 1] })
        $tag = @{ tab = $tk; i = $i }
        $tile = New-Object System.Windows.Forms.Panel; $tile.Size = New-Object System.Drawing.Size(($tw + 8), ($ih + 50)); $tile.Margin = New-Object System.Windows.Forms.Padding(4); $tile.Tag = $tag
        $im = Get-Thumb $key $o $tw $ih; $swc = Get-Swatch $o
        if ($im -or $swc) {
            $pb = New-Object System.Windows.Forms.PictureBox; $pb.SetBounds(4, 4, $tw, $ih); $pb.SizeMode = 'CenterImage'; $pb.BackColor = $C_PANEL2; $pb.Tag = $tag
            if ($im) { $pb.Image = $im } else { $pb.BackColor = $swc }
        } else {
            $pb = New-Label (T 'noPreview') $C_DIM $F_TINY; $pb.SetBounds(4, 4, $tw, $ih); $pb.TextAlign = 'MiddleCenter'; $pb.BackColor = $C_PANEL2; $pb.Tag = $tag
        }
        $lb = New-Label ([string]$r.cmb.Items[$i]) $C_TEXT $F_TINY; $lb.SetBounds(2, ($ih + 6), ($tw + 4), 42); $lb.TextAlign = 'TopCenter'; $lb.Tag = $tag; $lb.AutoEllipsis = $true
        $tip.SetToolTip($lb, [string]$r.cmb.Items[$i]); $tip.SetToolTip($pb, [string]$r.cmb.Items[$i])
        $tile.Controls.AddRange(@($pb, $lb))
        foreach ($ctl in @($tile, $pb, $lb)) {
            $ctl.Cursor = [System.Windows.Forms.Cursors]::Hand
            $ctl.Add_Click({ param($s2, $e3) Pick-Gallery $s2.Tag })
            $ctl.Add_MouseEnter({ param($s2, $e3) $t2 = $s2.Tag; Show-Preview $PANES[$t2.tab].focus $t2.i })
            $ctl.Add_MouseLeave({ param($s2, $e3) $t2 = $s2.Tag; Show-Preview $PANES[$t2.tab].focus })
        }
        $fl.Controls.Add($tile)
    }
    $fl.ResumeLayout()
    Layout-GalleryHead $tk
    Mark-Gallery $tk
}
function Layout-GalleryHead($tk) {
    # 一覧の見出しと説明: 1 行に入れば右に、入らなければ見出しの下の行に (見切れないように)
    $pn = $PANES[$tk]
    if (-not $pn.gw) { return }
    $x = [int]$pn.gx; $y = [int]$pn.gy; $w = [int]$pn.gw
    $capw = [int][math]::Min($w, (Text-W $pn.gcap.Text $F_SEC) + 16)
    $hw = (Text-W $pn.ghint.Text $F_TINY) + 8
    if (($capw + $hw) -le $w) {
        Set-Box $pn.gcap $x $y $capw 24
        $pn.ghint.Visible = $true; $pn.ghint.TextAlign = 'MiddleRight'; Set-Box $pn.ghint ($x + $capw) $y ($w - $capw) 24
        $fy = $y + 26
    } elseif ($pn.compact) {
        Set-Box $pn.gcap $x $y $w 24
        $pn.ghint.Visible = $false          # 低い窓: 説明は見出しの吹き出しだけ
        $fy = $y + 26
    } else {
        Set-Box $pn.gcap $x $y $w 24
        $pn.ghint.Visible = $true; $pn.ghint.TextAlign = 'MiddleLeft'; Set-Box $pn.ghint $x ($y + 22) $w 18
        $fy = $y + 42
    }
    Set-Box $pn.flow $x $fy $w ([int]$pn.gb - $fy)
}
function Mark-Gallery($tk) {
    $pn = $PANES[$tk]; if (-not $pn.focus) { return }
    $r = $rows[$pn.focus]; $si = $r.cmb.SelectedIndex
    foreach ($tile in $pn.flow.Controls) { $tile.BackColor = $(if ($tile.Tag.i -eq $si) { $C_ACC } else { $C_PANEL }) }
}
function Pick-Gallery($t2) {
    $r = $rows[$PANES[$t2.tab].focus]
    if (-not $r.cmb.Enabled) { return }
    if ($r.cmb.SelectedIndex -ne $t2.i) { $r.cmb.SelectedIndex = $t2.i }
}

# ---- MOD 管理 ----
function Get-ModDesired($m) {
    # チェックの状態 (適用したらこうなる): 項目のある取り込んだ MOD はその項目で選ばれているか、ほかは本人のチェック
    if ($m.type -eq 'ext') {
        $e = $m.ext
        if ($e.main) { $r = $rows[$e.main]; if (-not $r) { return $false }; $i = $r.cmb.SelectedIndex; return ($i -gt 0 -and [string]$r.opts[$i - 1] -eq ('ext:' + $e.name)) }
        return ($script:extOnPending -contains $e.name)
    }
    if ($script:modPending.ContainsKey($m.id)) { return [bool]$script:modPending[$m.id] }
    return [bool]$m.on
}
function Get-ModChecked($m) {
    # v1.1 (10-02 夜 本人「チェックを入れると項目が出現する方が直感的」): MOD 管理のチェック。項目のある取り込んだ MOD は「その項目の選択肢に出すか」、
    #   項目の無い MOD・~mods の MOD は今までどおり「適用したら置くか」(Get-ModDesired)
    if ($m.type -eq 'ext' -and $m.ext.main) { return (-not (Test-ExtHidden $m.ext.name)) }
    return (Get-ModDesired $m)
}
function Get-EntryAssets($m) { $a = @(); foreach ($u in $m.utocs) { $x = Get-BoxAssets $u; if ($x) { $a += $x } }; return $a }
function Fill-Mods {
    # MOD の一覧 (変更の件数に使うので毎回)。画面の一覧とぶつかる相手 (全部の箱の目次を読む) は MOD 管理のタブが見えているときだけ
    $script:modEntries = @(Get-ModEntries $script:gameRoot)
    if ($tabs.SelectedTab -ne $tabMods) { $script:modsDirty = $true; return }
    $script:modsDirty = $false
    $keepId = $(if ($lvMods.SelectedItems.Count -gt 0) { [string]$lvMods.SelectedItems[0].Tag } else { '' })
    $script:fillingMods = $true
    try {
        $lvMods.BeginUpdate(); $lvMods.Items.Clear()
        $script:modConf = $(if ($script:gameRoot) { Get-ModConflicts $script:gameRoot $script:modEntries } else { @{} })
        $script:compatInst = $(if ($script:gameRoot) { @(Get-CompatInstalled $script:gameRoot) } else { @() })      # v1.1 (10-02): 表記の「適用済」
        $script:entryCompat = @{}      # v1.1.1: ~mods の ELSB 対応の MOD の見分けは一覧を作り直すたびに
        # v1.1 (10-02 夜): 今ゲームに置かれている ELSB の項目 (詳しい欄の「今」の行)。共通の箱は _core。取り込んだ肌の MOD の箱 (0ELSB_Skin_) と互換の箱は数えない
        $script:elsbInstKinds = @{}
        if ($script:gameRoot) { foreach ($b in @(Get-ElsbInstalledBoxes $script:gameRoot)) { if ($b.kind) { $script:elsbInstKinds[[string]$b.kind] = $true } elseif ((Get-NewBoxName $b.name) -like ($BOX_PREFIX + 'ZCore*')) { $script:elsbInstKinds['_core'] = $true } } }
        Update-ModRowInfo
        foreach ($m in $script:modEntries) {
            $ri = $script:modRowInfo[$m.id]
            $it = New-Object System.Windows.Forms.ListViewItem([string]$m.name)
            $it.Checked = (Get-ModChecked $m); $it.Tag = $m.id
            $it.ToolTipText = [string]$m.name + $(if ($ri.badge) { '  [' + $ri.badge + ']' } else { '' }) + [Environment]::NewLine + $ri.info + $(if ($ri.chip) { '  [' + $ri.chip + ']' } else { '' }) + $(if ($ri.chip2) { '  [' + $ri.chip2 + ']' } else { '' })      # 10-02 夜: ファイルの重なりの数はやめた
            $it.ForeColor = $(if ($m.type -eq 'off') { $C_DIM } else { $C_TEXT })
            [void]$lvMods.Items.Add($it)
            if ($m.id -eq $keepId) { $it.Selected = $true }
        }
    } finally { $lvMods.EndUpdate(); $script:fillingMods = $false }
    Layout-ModColumns
    Show-ModDetail
}
function Ensure-ModsView { if ($script:modsDirty -and $tabs.SelectedTab -eq $tabMods) { Fill-Mods; Layout-Tabs } }
function Get-ModCompatState($m, $sel) {
    # v1.1 (10-02 夜): 取り込んだ MOD の ELSB の体に合わせた版 (互換) の状態。互換が無ければ $null
    #   state: applied = 今の選択で使い ~mods に置かれている / pending = 今の選択で使うがまだ適用していない / original = 条件を満たさず作者の元の形 /
    #          cantuse = この MOD のファイル名が先に来て使えない / off = この MOD を使っていない。badge = 一覧の表記の文字の鍵、bkind = 表記の色
    if ($m.type -ne 'ext') { return $null }
    foreach ($c in @(Get-CompatMods)) {
        $s = Get-CompatSource $c
        if (-not $s -or $s.name -ne $m.ext.name) { continue }
        if (-not (Test-CompatWins $c $s)) { return @{ c = $c; state = 'cantuse'; badge = 'badgeCantUse'; bkind = 'bad' } }
        if (-not (Get-ModDesired $m)) { return @{ c = $c; state = 'off'; badge = 'badgeAvail'; bkind = 'none' } }
        if (Test-CompatReq $c $sel $false) {
            if (@($script:compatInst) -contains $c.id) { return @{ c = $c; state = 'applied'; badge = 'badgeApplied'; bkind = 'ok' } }
            return @{ c = $c; state = 'pending'; badge = 'badgeNotApplied'; bkind = 'wait' }
        }
        return @{ c = $c; state = 'original'; badge = 'badgeNotApplied'; bkind = 'wait' }
    }
    return $null
}
function Item-Label($key) {
    # v1.1 (10-02 夜 本人「技術的すぎる」): 項目の名前を人物つきで (アンカの服・コーエンの体型 / Anca's outfit・Coen's body)
    $it = [string](T $key); $kd = Kind-Of $key
    if (-not $kd) { return $it }
    $tn = [string](T ('tab' + $kd.tab.Substring(0, 1).ToUpper() + $kd.tab.Substring(1)))
    if ($it.StartsWith($tn)) { return $it }
    if ($script:lang -eq 'ja') { return ($tn + 'の' + $it) }
    return ($tn + "'s " + $it.Substring(0, 1).ToLowerInvariant() + $it.Substring(1))
}
function Join-Words($arr) {
    # 日本語は「、」、英語は「A, B and C」
    $a = @(@($arr) | Where-Object { $_ } | ForEach-Object { [string]$_ })
    if ($script:lang -eq 'ja') { return ($a -join '、') }
    if ($a.Count -le 2) { return ($a -join ' and ') }
    return ((@($a | Select-Object -First ($a.Count - 1)) -join ', ') + ' and ' + $a[-1])
}
function Quote-Items($keys) {
    # ELSB の項目の名前を「」で並べる (英語は "" と Join-Words)。_core = 共通部分
    $q = @(@($keys) | ForEach-Object { [string]::Format((T 'itemQ'), $(if ($_ -eq '_core') { T 'coreName' } else { Item-Label $_ })) })
    if ($script:lang -eq 'ja') { return ($q -join '') }
    return (Join-Words $q)
}
function Cond-Text($reqs) {
    # 条件 @(@{ item; choice }) → 「アンカの体型」を「ELSB」、「アンカの体の場面」を「全部の場面」
    return (Join-Words @(@($reqs) | Where-Object { $_ -and $_.item } | ForEach-Object { [string]::Format((T 'condFmt'), (Item-Label $_.item), (Option-Name $_.item $_.choice)) }))
}
function Get-CoreSignature {
    # v1.1 (10-02 夜): ELSB の共通の箱 (modules\_core) のファイル (小文字 → $true)。Reset-DirCache で捨てる
    if ($script:coreSig) { return $script:coreSig }
    $h = @{}
    if ([IO.Directory]::Exists($CORE_DIR)) {
        foreach ($u in [IO.Directory]::GetFiles($CORE_DIR, '*.utoc', [IO.SearchOption]::AllDirectories)) { $a = Get-BoxAssets $u; if ($a) { foreach ($x in $a) { $h[([string]$x).ToLowerInvariant()] = $true } } }
    }
    $script:coreSig = $h
    return $h
}
function Get-ElsbStatic($m) {
    # v1.1 (10-02 夜 本人「選ばなくても、ZIP を取り込んだら ELSB と併用できるか分かる印を」): 今の選択に関係なく、この MOD と ELSB の関係。返り値 @{ state; keys; who; c }
    #   unknown = 中身を読めない / overlay = 肌・メイク・タトゥの項目 (ELSB の体の上に重ねる) / compat = ELSB の体に合わせた版がある (keys = それでも置き換える項目) /
    #   cantuse = あるが、この MOD のファイル名が先で使えない / ok = 重ならない /
    #   take = 取り込んだ MOD: 選ぶと、重なる ELSB の項目 keys をこの MOD が引き受ける (Current-Selection。その項目は「置き換え中」で選べない) /
    #   clash = ~mods・外してある MOD: ELSB の項目 keys (全部の選択肢) か共通の箱 (_core) と同じファイルを替える。道具は選び分けないので、名前の順で片方だけ (who = elsb / mod / mixed)
    if (@($m.utocs).Count -eq 0) { return @{ state = 'unknown'; keys = @() } }
    if ($m.type -eq 'ext') {
        $e = $m.ext
        $kd = $(if ($e.main) { Kind-Of $e.main } else { $null })
        if ($kd -and $kd.overlay) { return @{ state = 'overlay'; keys = @() } }
        $c = $null
        foreach ($c0 in @(Get-CompatMods)) { $s0 = Get-CompatSource $c0; if ($s0 -and $s0.name -eq $e.name) { $c = $c0; break } }
        if ($c -and -not (Test-CompatWins $c $e)) { return @{ state = 'cantuse'; keys = @(); c = $c } }
        $skip = @(); if ($e.main) { $skip += [string]$e.main }
        if ($c) { $skip += @($c.frees) + @($c.keeps) + @(@($c.requires) | ForEach-Object { [string]$_.item }) }      # 互換の条件の項目は ELSB のまま選べる (Get-UsedBy)
        $tk = @(@($e.kinds) | Where-Object { $skip -notcontains $_ })
        if ($c) { return @{ state = 'compat'; keys = $tk; c = $c } }
        if ($tk.Count -gt 0) { return @{ state = 'take'; keys = $tk } }
        return @{ state = 'ok'; keys = @() }
    }
    $sig = Get-KindSignature; $core = Get-CoreSignature
    $hit = @{}; $mf = $false; $ef = $false
    foreach ($u in @($m.utocs)) {
        $first = ([string]::CompareOrdinal(([IO.Path]::GetFileNameWithoutExtension([string]$u)).ToLowerInvariant(), $BOX_PREFIX.ToLowerInvariant()) -lt 0)
        $a = Get-BoxAssets $u
        if (-not $a) { continue }
        foreach ($x in $a) {
            $xl = ([string]$x).ToLowerInvariant(); $h = $false
            foreach ($kd in $KINDS) { if ($sig[$kd.key] -and $sig[$kd.key].ContainsKey($xl)) { $hit[$kd.key] = $true; $h = $true } }
            if ($core.ContainsKey($xl)) { $hit['_core'] = $true; $h = $true }
            if ($h) { if ($first) { $mf = $true } else { $ef = $true } }
        }
    }
    if ($hit.Count -eq 0) { return @{ state = 'ok'; keys = @() } }
    $keys = @($KINDS | Where-Object { $hit.ContainsKey($_.key) } | ForEach-Object { $_.key }); if ($hit.ContainsKey('_core')) { $keys += '_core' }
    return @{ state = 'clash'; keys = $keys; who = $(if ($mf -and $ef) { 'mixed' } elseif ($mf) { 'mod' } else { 'elsb' }) }
}
function Get-CompatBoxNames($c) {
    # v1.1.1: 互換の箱の名前 (主・extra・服の表の写し・部分・操作キャラの写し)
    return @(@($c.box) + @($c.extra) + @(@($c.dtv) | ForEach-Object { $_.box }) + @(@($c.parts) | ForEach-Object { @($_.box) + @($_.extra) }) + @(@($c.playas.Values) | ForEach-Object { $_.box }) | Where-Object { $_ })
}
function Test-CompatPlaced($c) {
    # v1.1.1: この互換の箱のどれかが ~mods にあるか
    if (-not $script:gameRoot) { return $false }
    $paks = Get-PaksDir $script:gameRoot
    foreach ($b in @(Get-CompatBoxNames $c)) { if (Test-Path -LiteralPath (Join-Path $paks ($b + '.ucas'))) { return $true } }
    return $false
}
function Get-CompatOfEntry($m) {
    # v1.1.1 (本人「~mods に直接入っていても、ELSB 対応の MOD は見分けて」): ~mods・外してある MOD が、互換の相手の MOD と中身が同じか
    #   (manifest の .ucas・.utoc を大きさでふるってから SHA256。取り込んだ MOD の Get-CompatSource と同じ照合)。同じならその互換、違えば $null。Fill-Mods ごとに控える
    if ($m.type -eq 'ext' -or $m.family) { return $null }
    if ($null -eq $script:entryCompat) { $script:entryCompat = @{} }
    if ($script:entryCompat.ContainsKey($m.id)) { return $script:entryCompat[$m.id] }
    $hit = $null
    $files = @(@($m.files) | Where-Object { $_ -match '\.(ucas|utoc)$' } | ForEach-Object { New-Object IO.FileInfo([string]$_) })
    if ($files.Count -gt 0) {
        foreach ($c in @(Get-CompatMods)) {
            $all = $true
            foreach ($sx in $c.src) {
                $ok = $false
                foreach ($f in $files) { if ($f.Length -eq $sx.size -and ([string](Get-FileHash256 $f.FullName)).ToUpperInvariant() -eq $sx.sha) { $ok = $true; break } }
                if (-not $ok) { $all = $false; break }
            }
            if ($all) { $hit = $c; break }
        }
    }
    $script:entryCompat[$m.id] = $hit
    return $hit
}
function Get-OrphanCompat($root) {
    # v1.1.1 (本人「体に合わせた版が外れる適用の前に確認の窓を」): ~mods にある互換の箱のうち、相手の MOD がこの ELSB に取り込まれていない物 (適用すると外れる)。
    #   前の版や別のフォルダの ELSB で置いた物。返り値: 相手の MOD の名前 (manifest の title から「(ELSB fit)」を除いた物)
    $out = @()
    foreach ($c in @(Get-CompatMods)) {
        if (Get-CompatSource $c) { continue }
        if (-not (Test-CompatPlaced $c)) { continue }
        $out += ([string]$c.title -replace '\s*\(ELSB fit\)$', '')
    }
    return $out
}
function Test-CanImportEntry($m, $ec) {
    # v1.1.1: 「取り込む」を出す ~mods の MOD = 1 つの箱のまとまり (BoDQS などの束は除く)、中身を読める、見た目の MOD か ELSB 対応
    if ($m.type -ne 'paks' -or $m.family -or @($m.utocs).Count -eq 0) { return $false }
    if ($ec) { return $true }
    return (@(Get-ModSubjects (Get-EntryAssets $m)) -notcontains 'subjNone')
}
function Get-ModStatus($m, $cs) {
    # v1.1 (10-02 夜): 2 つめの印 = 今ゲームに入っている MOD のうち、使われていないファイルがある物だけ (意図どおりの重なりは数えない)。
    #   今は一部が使われていない = ほかの MOD や ELSB の方が使われるファイルがある / 今は使われていない = 全部。問題なし・入っていない・目次を読めない MOD は $null
    if (@($m.utocs).Count -eq 0 -or -not $m.on -or -not (Get-ModDesired $m)) { return $null }
    $l = $script:modLost[$m.id]
    if (-not $l -or $l.total -le 0) { return $null }
    $lost = [int]$l.mods + $(if ($cs -and ($cs.state -eq 'applied' -or $cs.state -eq 'pending')) { 0 } else { [int]$l.elsb })
    if ($lost -le 0) { return $null }
    if ($lost -ge $l.total) { return @{ text = (T 'statusNone'); kind = 'bad' } }
    return @{ text = (T 'statusPart'); kind = 'wait' }
}
function Update-ModRowInfo {
    # v1.1 (10-02 夜): 一覧の ELSB の表記・2 行目・印を作り直す (ぶつかる相手は Fill-Mods で読んだ物を使う)
    #   2 行目 = 項目のある取り込んだ MOD は「アンカの服 · 選択中」、ほかは「~mods の MOD · コーエン」。印 1 = ELSB との関係 (選んでいなくても出す)、印 2 = 今の困りごと
    $sel = Current-Selection; $info = @{}
    $dot = '   ' + [string][char]0x00B7 + '   '
    foreach ($m in $script:modEntries) {
        $subj = $(if (@($m.utocs).Count -eq 0) { '?' } else { ((Get-ModSubjects (Get-EntryAssets $m)) | ForEach-Object { T $_ }) -join ', ' })     # 目次の無い古い形式は分からない
        $where = $(if ($m.type -eq 'ext') { T 'whereExt' } elseif ($m.type -eq 'paks') { T 'whereMods' } else { T 'whereOff' })
        $cs = Get-ModCompatState $m $sel; $st = Get-ModStatus $m $cs; $es = Get-ElsbStatic $m
        if ($m.type -eq 'ext' -and $m.ext.main) { $line = (Item-Label $m.ext.main) + $dot + $(if (Get-ModDesired $m) { T 'rowSelected' } elseif (Test-ExtHidden $m.ext.name) { T 'rowHidden' } else { T 'rowListed' }) }
        elseif (@($m.utocs).Count -eq 0) { $line = $where + $dot + (T 'modUnreadable') }
        else { $line = $where + $dot + $subj }
        $c1 = ''; $k1 = ''
        if ($es.state -eq 'ok' -or $es.state -eq 'overlay' -or ($es.state -eq 'compat' -and @($es.keys).Count -eq 0)) { $c1 = T 'statusOk'; $k1 = 'ok' }
        elseif ($es.state -eq 'take' -or $es.state -eq 'compat') { $c1 = T 'statusTake'; $k1 = 'wait' }
        elseif ($es.state -eq 'clash') { $c1 = T 'statusClash'; $k1 = 'wait' }
        # v1.1.1: ~mods に直接入っている ELSB 対応の MOD は「ELSB 対応 (取り込むと使えます)」。体に合わせた版に使われないのは狙いどおりなので赤い印は出さない
        $ec = $(if ($m.type -ne 'ext') { Get-CompatOfEntry $m } else { $null })
        if ($ec) { $st = Get-ModStatus $m @{ state = 'applied' }; $c1 = ''; $k1 = '' }
        $info[$m.id] = @{ info = $line; chip = $c1; ckind = $k1; chip2 = $(if ($st) { $st.text } else { '' }); ckind2 = $(if ($st) { $st.kind } else { '' }); badge = $(if ($cs) { T $cs.badge } elseif ($ec) { T 'badgeImport' } else { '' }); bkind = $(if ($cs) { $cs.bkind } elseif ($ec) { 'wait' } else { '' }); subj = $subj; where = $where }
    }
    $script:modRowInfo = $info
}
function Layout-ModColumns {
    # v1.1 (10-02 夜): 列は 1 つで一覧の幅いっぱい (横のスクロールを出さない)。縦のスクロールがまだ出ていなくても出る数なら、その幅を先に引く。
    #   名前が 1 行に入らない MOD があれば、全部の行を名前 2 行の高さに (ListView の行の高さは全部同じ)
    if ($lvMods.Columns.Count -lt 1) { return }
    $iw = $lvMods.ClientSize.Width
    if ($iw -lt 100) { return }
    $sbw = [System.Windows.Forms.SystemInformation]::VerticalScrollBarWidth
    $full = $lvMods.Width - 2
    $need = 1
    foreach ($it in $lvMods.Items) {
        $ri = $script:modRowInfo[[string]$it.Tag]
        $bw = $(if ($ri -and $ri.badge) { [System.Windows.Forms.TextRenderer]::MeasureText([string]$ri.badge, $F_MODTXT).Width + 22 } else { 0 })
        if ((Text-W $it.Text $F_MODNAME) -gt ($full - $sbw - $script:chkX - 34 - $bw)) { $need = 2; break }
    }
    if ($need -ne $script:modNameLines) {
        $script:modNameLines = $need
        $il = New-Object System.Windows.Forms.ImageList; $il.ImageSize = New-Object System.Drawing.Size(1, (Mod-RowH $need)); $lvMods.SmallImageList = $il
    }
    $th = $lvMods.Items.Count * (Mod-RowH $script:modNameLines)
    if (($full - $iw) -lt $sbw -and $th -gt $lvMods.ClientSize.Height) { $iw -= $sbw }      # まだ出ていない縦のスクロールの分
    $lvMods.Columns[0].Width = [int][math]::Max(60, $iw - 1)
}
function Sync-ModChecks {
    $script:fillingMods = $true
    try { foreach ($it in $lvMods.Items) { $m = $script:modEntries | Where-Object { $_.id -eq [string]$it.Tag } | Select-Object -First 1; if ($m) { $d = Get-ModChecked $m; if ($it.Checked -ne $d) { $it.Checked = $d } } } } finally { $script:fillingMods = $false }
    if ($tabs.SelectedTab -eq $tabMods) { Update-ModRowInfo } else { $script:modsDirty = $true }      # v1.1 (10-02): 選択が変わると互換の表記も変わる
    $lvMods.Invalidate()
}
function Selected-Mod { if ($lvMods.SelectedItems.Count -eq 0) { return $null }; $id = [string]$lvMods.SelectedItems[0].Tag; return ($script:modEntries | Where-Object { $_.id -eq $id } | Select-Object -First 1) }
function Show-ModDetail {
    $m = Selected-Mod
    $isExt = [bool]($m -and $m.type -eq 'ext'); $script:modIsExt = $isExt
    foreach ($c in @($lblModItemCap, $cmbModItem, $arrModItem, $btnModRename, $btnModRemove)) { $c.Visible = $isExt }
    $btnModImport.Visible = $false; $script:modCanImport = $false      # v1.1.1: ~mods の MOD を取り込むボタン
    if (-not $m) {
        $lblModTitle.Text = $(if (@($script:modEntries).Count -eq 0) { T 'modNone' } else { T 'modPick' }); $lblModMeta.Text = ''; $txtModDetail.Text = ''
        $lblModFilesCap.Text = (T 'modFilesCap'); $txtModFiles.Text = ''; return
    }
    $a = @(Get-EntryAssets $m)
    $where = $(if ($m.type -eq 'ext') { T 'whereExt' } elseif ($m.type -eq 'paks') { T 'whereMods' } else { T 'whereOff' })
    $dot = '   ' + [string][char]0x00B7 + '   '
    $lblModTitle.Text = [string]$m.name; $tip.SetToolTip($lblModTitle, [string]$m.name)
    $lblModMeta.Text = $where + $dot + $(if (@($m.utocs).Count -eq 0) { T 'modUnreadable' } else { (((Get-ModSubjects $a) | ForEach-Object { T $_ }) -join ', ') })      # 10-02 夜: pak の組の数はやめた (本人「技術的すぎる」)
    if ($isExt) {
        $script:fillingMods = $true
        try {
            $cmbModItem.Items.Clear(); [void]$cmbModItem.Items.Add((T 'modItemNone'))
            $ich = @(Get-ExtItemChoices $m.ext)      # v1.1 (10-02): + 性器など anyExt の項目
            foreach ($k in $ich) { if (Kind-Of $k) { [void]$cmbModItem.Items.Add((Item-Label $k)) } }      # 10-02 夜: 「アンカ / アンカの服」→「アンカの服」
            $j = [array]::IndexOf($ich, $m.ext.main); $cmbModItem.SelectedIndex = $(if ($m.ext.main -and $j -ge 0) { $j + 1 } else { 0 })
        } finally { $script:fillingMods = $false }
    }
    $nl = [Environment]::NewLine; $lines = @()
    $ind = ([string][char]0xA0) * 3          # 字下げは改行しない空白 (普通の空白だと長いパスの前で折り返して空の行ができる)
    $sel = Current-Selection
    if ($isExt -and -not $m.ext.main) { $lines += (T 'modGeneral'); $lines += '' }
    # v1.1.1 (本人「懸念点は全て払拭したい」): ~mods に直接入っている MOD は、そうだと分かるように。外し方・取り込み方 (取り込むと人物のタブで選べる)
    $ec = $(if (-not $isExt) { Get-CompatOfEntry $m } else { $null })
    $canImport = Test-CanImportEntry $m $ec
    $script:modCanImport = $canImport; $btnModImport.Visible = $canImport
    if ($m.type -eq 'paks' -and -not $ec) { $lines += (T 'modDirect'); if ($canImport) { $lines += (T 'modDirectImport') }; $lines += '' }
    elseif ($m.type -eq 'off') { $lines += (T 'modOffNote'); $lines += '' }
    # v1.1 (10-02 夜 本人「選ばなくても ELSB と併用できるか分かるように」「技術的すぎる」): ELSB との関係 → ほかの MOD との関係。ファイルの数・名前の順は出さない
    $es = Get-ElsbStatic $m
    $lines += (T 'secElsb')
    if ($ec) {
        # v1.1.1: ~mods に直接入っている ELSB 対応の MOD (取り込むと体に合わせた版が使える)
        $lines += ($ind + (T 'relReady'))
        if ($canImport) { $lines += ($ind + (T 'relReadyHow')) }
        if (Test-CompatPlaced $ec) { $lines += ($ind + (T 'nowReadyPlaced')) }
    }
    elseif ($es.state -eq 'unknown') { $lines += ($ind + (T 'modUnreadable')) }
    elseif ($es.state -eq 'ok') { $lines += ($ind + (T 'relOk')) }
    elseif ($es.state -eq 'overlay') { $lines += ($ind + (T 'relOverlay')) }
    elseif ($es.state -eq 'cantuse') { $lines += ($ind + (T 'relCantUse')) }
    elseif ($es.state -eq 'take') {
        $lines += ($ind + (T 'relOk'))
        $lines += ($ind + [string]::Format((T 'relTake'), (Quote-Items $es.keys)))
        if (Get-ModDesired $m) { $lines += ($ind + [string]::Format((T 'nowTaken'), (Quote-Items $es.keys))) }
    }
    elseif ($es.state -eq 'compat') {
        # ELSB の体に合わせた版 (互換): 使うか・今ゲームに入っているか・使うための条件
        $c = $es.c; $s = Get-CompatSource $c; $on = Get-ModDesired $m; $cst = Get-ModCompatState $m $sel
        $lines += ($ind + (T 'relCompat'))
        if (@($es.keys).Count -gt 0) { $lines += ($ind + [string]::Format((T 'relTake'), (Quote-Items $es.keys))) }
        if ($cst -and $cst.state -eq 'applied') { $lines += ($ind + (T 'nowApplied')) }
        elseif ($cst -and $cst.state -eq 'pending') { $lines += ($ind + (T 'nowPending')) }
        else {
            $mk = $(if ($m.ext.main) { [string]$m.ext.main } else { [string]$c.srcItem })
            $how = Cond-Text @($c.requires)
            $lines += ($ind + $(if ($mk) { [string]::Format((T 'relCompatHow'), (Item-Label $mk), $how) } else { [string]::Format((T 'relCompatHow2'), $how) }))
            $lines += ($ind + $(if ($cst -and $cst.state -eq 'original') { T 'nowOriginal' } else { T 'nowOff' }))
        }
        foreach ($pt in @($c.parts)) {
            # v1.1 (10-02): 互換の部分 (Coen Nude のマラト用など)。主と別の条件
            $plab = $(if ($pt.item) { Item-Label $pt.item } else { [string]$pt.title })
            if (-not (Test-CompatWins @{ box = $pt.box } $s)) { $lines += ($ind + [string]::Format((T 'partCantUse'), $plab)) }
            elseif (Test-CompatPartOn $pt $sel $on) { $lines += ($ind + [string]::Format($(if (@($script:compatInst) -contains ($c.id + ':' + $pt.id)) { T 'partApplied' } else { T 'partPending' }), $plab)) }
            else {
                $pr = @(); if ($pt.item) { $pr += @{ item = $pt.item; choice = $pt.opt } }; $pr += @($pt.requires)
                $lines += ($ind + [string]::Format((T 'partHow'), $plab, (Cond-Text $pr)))
            }
        }
    }
    elseif ($es.state -eq 'clash') {
        # ~mods の MOD: ELSB の項目と同じファイルを替える。どちらが使われるか・一緒に使う方法・今ぶつかっているか
        $who = $(if ($es.who -eq 'mod') { T 'clashMod' } elseif ($es.who -eq 'mixed') { T 'clashMixed' } else { T 'clashElsb' })
        $lines += ($ind + [string]::Format((T 'relClash'), (Quote-Items $es.keys), $who))
        $fx = @(@($es.keys) | Where-Object { $_ -ne '_core' } | ForEach-Object { $kd = Kind-Of $_; [string]::Format((T 'condFmt'), (Item-Label $_), $(if ($kd.first) { T $kd.first } else { T 'vanilla' })) })
        if ($fx.Count -gt 0) { $lines += ($ind + [string]::Format((T 'relClashFix'), (Join-Words $fx))) }
        $use = @(@($es.keys) | Where-Object { $script:elsbInstKinds -and $script:elsbInstKinds.ContainsKey([string]$_) })
        if ($use.Count -gt 0) { $lines += ($ind + [string]::Format($(if ($m.type -eq 'paks') { T 'nowClash' } else { T 'nowClashIdle' }), (Quote-Items $use))) }
        else { $lines += ($ind + [string]::Format((T 'nowFree'), (Quote-Items $es.keys))) }
    }
    $lines += ''
    # ほかの MOD との関係 (今ゲームに入っている MOD。ほかの MOD の ELSB の体に合わせた版は相手の MOD の名前で、自分の版は出さない)
    $lines += (T 'secOther')
    $ol = @()
    foreach ($c in @(@($script:modConf[$m.id]) | Where-Object { $_ })) {
        if ($c.elsb -and -not $c.src) { continue }      # ELSB の項目・共通の箱は「ELSB との関係」で
        if ($isExt -and [string]$c.src -eq [string]$m.ext.name) { continue }
        $alt = $false
        if ($isExt -and $m.ext.main) { $oe = Get-ExtByName ([string]$c.other); if ($oe -and $oe.main -eq $m.ext.main) { $alt = $true } }
        if ($alt) { $ol += ($ind + [string]::Format((T 'otherAlt'), $c.other, (Item-Label $m.ext.main))) }
        elseif ($c.win) { $ol += ($ind + [string]::Format((T 'otherWin'), $c.other)) }
        else { $ol += ($ind + [string]::Format((T 'otherLose'), $c.other)) }
    }
    if ($ol.Count -eq 0) { $ol += ($ind + (T 'otherNone')) }
    $lines += $ol
    $txtModDetail.Text = ($lines -join $nl)
    # 置き換えるファイル (右の列、v1.1 10-02 夜)。フォルダごとにまとめ、パスは省略しない
    $fl = @()
    if ($a.Count -eq 0) { $fl += (T 'modUnreadable') }
    $grp = [ordered]@{}
    foreach ($x in $a) {
        $pth = ($x -replace '^(\.\./)*dawnwalker/content/', '') -replace '^_dawnwalker/', ''
        $sl = $pth.LastIndexOf('/'); $dir = $(if ($sl -ge 0) { $pth.Substring(0, $sl) } else { '' })
        if (-not $grp.Contains($dir)) { $grp[$dir] = New-Object System.Collections.ArrayList }
        [void]$grp[$dir].Add($pth.Substring($sl + 1))
    }
    foreach ($dir in @($grp.Keys | Sort-Object)) {
        $fl += ($dir + '/')
        foreach ($fn in @($grp[$dir] | Sort-Object)) { $fl += ($ind + $ind + $fn) }
        $fl += ''
    }
    $lblModFilesCap.Text = (T 'modFilesCap') + ' (' + $a.Count + ')'
    $txtModFiles.Text = ($fl -join $nl)
}

# ---- 並べ方 ----
function Layout-All {
    if (-not $script:initDone) { return }
    $cw = $form.ClientSize.Width; $ch = $form.ClientSize.Height
    if ($cw -lt 600 -or $ch -lt 400) { return }
    # 見出しの帯: 左にロゴ (無ければ ELSB の文字)、その右に名前と一言、右に版と言語
    Set-Box $pnlHead 0 0 $cw $HEAD_H; Render-Head
    if ($IMG_LOGO) { Set-Box $picLogo 14 3 ($HEAD_H - 6) ($HEAD_H - 6); $tx = $picLogo.Right + 10 }
    else { $lblTitle.Location = New-Object System.Drawing.Point(18, 12); $tx = $lblTitle.Right + 12 }
    $lblSub.Location = New-Object System.Drawing.Point($tx, 10)
    $lblVer.Location = New-Object System.Drawing.Point(($lblSub.Right + 8), 19)
    if ($IS_DEV) { Set-Box $lblDev ($lblVer.Right + 8) 18 44 21 }
    Set-Box $cmbLang ($cw - 20 - 130) ([int](($HEAD_H - 26) / 2)) 130 26; Place-ComboArrow $cmbLang
    Set-Box $lblTag ($tx + 2) 42 ($cmbLang.Left - $tx - 12) 22
    $y0 = $HEAD_H + 12
    $gw = Text-W $lblGameCap.Text $F_BASE
    Set-Box $lblGameCap 20 $y0 ($gw + 8) 28
    $bw = [math]::Max(110, (Text-W $btnBrowse.Text $F_BASE) + 30)
    Set-Box $btnBrowse ($cw - 20 - $bw) ($y0 - 2) $bw 30
    Set-Box $txtGame ($lblGameCap.Right + 6) ($y0 + 1) ($btnBrowse.Left - 10 - ($lblGameCap.Right + 6)) 26
    Set-Box $lblStVal 20 ($y0 + 30) ($cw - 40) 20
    Set-Box $pnlTabStrip 16 ($y0 + 50) ($cw - 32) 38; Layout-TabStrip
    $ty0 = $y0 + 90           # 最小の窓 (外側 1100x880、v1.1) でもコーエン・マラトの列がスクロールしない高さ (リリース版の検査 gt_steps_rel)
    $pw0 = $cw - 32; $ph0 = $ch - $ty0 - 86
    Set-Box $pnlPages 16 $ty0 $pw0 $ph0
    if (-not $script:tabInset) {
        # 枠の幅 (ページの外側の余白) を 1 回だけ測る: 左・上・右・下
        Set-Box $tabs 0 0 400 300; $dr0 = $tabs.DisplayRectangle
        $script:tabInset = @($dr0.X, $dr0.Y, ($tabs.Width - $dr0.Right), ($tabs.Height - $dr0.Bottom))
    }
    $ti4 = $script:tabInset
    Set-Box $tabs (-$ti4[0]) (-$ti4[1]) ($pw0 + $ti4[0] + $ti4[2]) ($ph0 + $ti4[1] + $ti4[3])
    $by = $ch - 78
    $w1 = [math]::Max(100, (Text-W $btnClose.Text $F_BASE) + 34); Set-Box $btnClose ($cw - 20 - $w1) $by $w1 38
    $w2 = [math]::Max(150, (Text-W $btnApply.Text $btnApply.Font) + 40); Set-Box $btnApply ($btnClose.Left - 10 - $w2) $by $w2 38
    $w3 = [math]::Max(110, (Text-W $btnRemove.Text $F_BASE) + 34); Set-Box $btnRemove ($btnApply.Left - 10 - $w3) $by $w3 38
    $w4 = [math]::Max(110, (Text-W $btnRevert.Text $F_BASE) + 34); Set-Box $btnRevert ($btnRemove.Left - 10 - $w4) $by $w4 38
    Set-Box $lblChanges 20 $by ($btnRevert.Left - 34) 38
    Set-Box $lblMsg 20 ($ch - 34) ($cw - 40) 22
    Layout-Tabs
}
function Layout-Tabs {
    if (-not $script:initDone) { return }
    $dr = $tabs.DisplayRectangle; $W = $dr.Width; $H = $dr.Height
    if ($W -lt 500 -or $H -lt 200) { return }
    $badW = [int][math]::Max(64, (Text-W (T 'badge') $F_SMALL) + 18)
    $cmbW = $script:comboW
    $LW = 18 + $script:capW + 6 + $cmbW + 8 + $badW + 12
    $minRight = 420
    if (($W - $LW) -lt $minRight) { $cut = $minRight - ($W - $LW); $cmbW = [int][math]::Max(220, $cmbW - $cut); $LW = 18 + $script:capW + 6 + $cmbW + 8 + $badW + 12 }
    foreach ($tk in $CHAR_TABS) {
        $lp0 = $LEFTS[$tk]; $lp0.SuspendLayout()
        $oy = $lp0.AutoScrollPosition.Y
        $y = 10 + $oy
        foreach ($sc in $SECTIONS) {
            $ks = @($KINDS | Where-Object { $_.tab -eq $tk -and $_.sec -eq $sc })
            $vis = @($ks | Where-Object { -not ($_.hideEmpty -and @($rows[$_.key].opts).Count -eq 0) } | ForEach-Object { $_.key })
            $sh = $SECHEAD[$tk + '/' + $sc]
            if ($vis.Count -eq 0) {
                $sh.lbl.Visible = $false; $sh.line.Visible = $false
                foreach ($k in $ks) { $rw = $rows[$k.key]; $rw.shown = $false; foreach ($ctl in @($rw.cap, $rw.cmb, $rw.bad, $rw.use, $rw.arr)) { $ctl.Visible = $false } }
                continue
            }
            $sh.lbl.Visible = $true; $sh.line.Visible = $true
            Set-Box $sh.lbl 14 $y ($LW - 34) 22
            Set-Box $sh.line 14 ($y + 24) ($LW - 34) 1
            $y += 32
            foreach ($k in $ks) {
                $rw = $rows[$k.key]; $show = ($vis -contains $k.key); $rw.shown = $show
                $rw.cap.Visible = $show; $rw.cmb.Visible = $show; $rw.arr.Visible = $show
                if (-not $show) { $rw.bad.Visible = $false; $rw.use.Visible = $false; continue }
                Set-Box $rw.cap 18 ($y + 2) $script:capW 30
                $rw.cmb.SetBounds((18 + $script:capW + 6), $y, $cmbW, 34); Place-ComboArrow $rw.cmb
                $rw.cmb.DropDownWidth = [int][math]::Max($cmbW, $script:comboW)
                Set-Box $rw.bad ($rw.cmb.Right + 8) ($y + 6) $badW 22
                Set-Box $rw.use ($rw.cmb.Right + 8) ($y + 6) ($LW - ($rw.cmb.Right + 8) - 6) 22
                $tip.SetToolTip($rw.cap, (T $k.key))
                $y += 42
            }
            $y += 8
        }
        if ($NOTES.ContainsKey($tk)) {
            $nt = $NOTES[$tk]
            $nh = [System.Windows.Forms.TextRenderer]::MeasureText($nt.Text, $nt.Font, (New-Object System.Drawing.Size(($LW - 40), 2000)), [System.Windows.Forms.TextFormatFlags]'WordBreak, NoPrefix').Height
            Set-Box $nt 18 ($y + 2) ($LW - 40) ($nh + 6)
            $y += $nh + 12
        }
        # 中身が窓より高いときだけ縦のスクロールバーを出し、その幅だけ列を広げる (横のスクロールバーは出さない)
        $contentH = [int]($y - $oy + 6)
        $pw = $LW + 2
        if ($contentH -gt $H) { $pw += [System.Windows.Forms.SystemInformation]::VerticalScrollBarWidth; $lp0.AutoScrollMinSize = New-Object System.Drawing.Size(0, $contentH) }
        else { $lp0.AutoScrollMinSize = New-Object System.Drawing.Size(0, 0) }
        Set-Box $lp0 0 0 $pw $H
        $lp0.ResumeLayout($true)
        $pn = $PANES[$tk]; $rx = $pw + 4; $rw2 = $W - $rx - 10
        $pn.compact = ($H -lt 420)          # 低い窓 (小さい画面・表示倍率が高い): 見本を小さく、説明の行を隠して画像の一覧の場所を残す
        if ($pn.compact) {
            $ph = [int][math]::Max(90, $H * 0.3)
            Set-Box $pn.pic $rx 8 $rw2 $ph
            Set-Box $pn.lbl $rx ($ph + 8) $rw2 22
            $pn.hint.Visible = $false
            $pn.gx = $rx; $pn.gy = $ph + 34
        } else {
            $ph = [int][math]::Max(200, ($H - 20) * 0.48)
            Set-Box $pn.pic $rx 8 $rw2 $ph
            Set-Box $pn.lbl $rx ($ph + 10) $rw2 40          # 2 行まで (見本が無いときの「体型: …」まで入れる)
            Set-Box $pn.hint $rx ($ph + 50) $rw2 18
            $pn.hint.Visible = $true
            $pn.gx = $rx; $pn.gy = $ph + 72
        }
        $pn.gw = $rw2; $pn.gb = $H - 8
        Layout-GalleryHead $tk
    }
    # MOD 管理 (v1.1 10-02 夜: 一覧は幅いっぱい、詳しい欄は下に 2 列 = 左に名前・選ぶ項目・ELSB 対応・ぶつかる相手、右に置き換えるファイル)
    $b1 = [math]::Max(120, (Text-W $btnModRescan.Text $F_BASE) + 30); $b2 = [math]::Max(120, (Text-W $btnModOpen.Text $F_BASE) + 30); $b3 = [math]::Max(130, (Text-W $btnModAdd.Text $F_BASE) + 30)
    Set-Box $btnModRescan ($W - 12 - $b1) 10 $b1 30
    Set-Box $btnModOpen ($btnModRescan.Left - 8 - $b2) 10 $b2 30
    Set-Box $btnModAdd ($btnModOpen.Left - 8 - $b3) 10 $b3 30
    $hw = $btnModAdd.Left - 24
    $hh = [System.Windows.Forms.TextRenderer]::MeasureText([string]$lblModsHint.Text, $lblModsHint.Font, (New-Object System.Drawing.Size([math]::Max(100, $hw), 400)), [System.Windows.Forms.TextFormatFlags]'WordBreak, NoPrefix').Height
    Set-Box $lblModsHint 12 6 $hw ([math]::Max(42, $hh + 4))
    $ly = [int][math]::Max(54, $lblModsHint.Bottom + 6)
    $avail = $H - $ly - 10
    $dh = [int][math]::Max(240, $avail * 0.46)
    $lh = [int][math]::Max(110, $avail - $dh - 12)
    Set-Box $lvMods 12 $ly ($W - 24) $lh
    Layout-ModColumns
    $y0 = $ly + $lh + 12
    $lw = [int](($W - 36) / 2); $rx = 12 + $lw + 12; $rw2 = $W - $rx - 12
    $th = $(if ((Text-W $lblModTitle.Text $lblModTitle.Font) -gt ($lw - 6)) { 54 } else { 30 })
    Set-Box $lblModTitle 12 $y0 $lw $th
    Set-Box $lblModMeta 12 ($y0 + $th) $lw 22
    $yy = $y0 + $th + 26
    if ($script:modIsExt) {
        # 選ぶ項目のドロップダウンの右に、名前を変える・一覧から消す (1 段にまとめて一覧を高く)
        $bw1 = [math]::Max(110, (Text-W $btnModRename.Text $F_BASE) + 26); $bw2 = [math]::Max(110, (Text-W $btnModRemove.Text $F_BASE) + 26)
        Set-Box $lblModItemCap 12 $yy $lw 22
        $cy = $yy + 23
        Set-Box $btnModRemove (12 + $lw - $bw2) $cy $bw2 ([math]::Max(30, $cmbModItem.Height))
        Set-Box $btnModRename ($btnModRemove.Left - 8 - $bw1) $cy $bw1 ([math]::Max(30, $cmbModItem.Height))
        Set-Box $cmbModItem 12 $cy ([math]::Max(120, $btnModRename.Left - 8 - 12)) 28; Place-ComboArrow $cmbModItem
        $yy = $cy + [math]::Max(30, $cmbModItem.Height) + 8
    }
    elseif ($script:modCanImport) {
        # v1.1.1: ~mods の MOD を取り込むボタン (名前の下、説明の上)
        $bw0 = [math]::Max(130, (Text-W $btnModImport.Text $F_BASE) + 34)
        Set-Box $btnModImport 12 $yy $bw0 32
        $yy = $yy + 32 + 8
    }
    Set-Box $txtModDetail 12 $yy $lw ([math]::Max(40, $H - $yy - 10))
    Set-Box $lblModFilesCap $rx $y0 $rw2 22
    Set-Box $txtModFiles $rx ($y0 + 24) $rw2 ([math]::Max(40, $H - $y0 - 34))
}
$form.Add_Resize({ Layout-All })
$tabs.Add_SizeChanged({ Layout-Tabs })
$tabs.Add_SelectedIndexChanged({ Update-TabStrip; Layout-Tabs; Ensure-TabView; Ensure-ModsView })

# ---- 文字 ----
function Update-Texts {
    $form.Text = $PRODUCT_FULL + '  ' + $TOOL_VER + $(if ($IS_DEV) { '  [DEV]' } else { '' })
    $lblTag.Text = (T 'tagline'); $tip.SetToolTip($lblTag, $lblTag.Text)
    $lblGameCap.Text = (T 'gameLabel'); $btnBrowse.Text = (T 'browse')
    $tabCoen.Text = (T 'tabCoen'); $tabAnca.Text = (T 'tabAnca'); $tabLacra.Text = (T 'tabLacra'); $tabMarat.Text = (T 'tabMarat'); $tabMods.Text = (T 'tabMods')
    foreach ($pv in $PANES.Values) { $pv.hint.Text = (T 'picHint'); $pv.ghint.Text = (T 'galleryHint'); $tip.SetToolTip($pv.ghint, $pv.ghint.Text) }
    foreach ($tk in $PARTNER_TABS) { $NOTES[$tk].Text = (T 'partnerNote') }
    foreach ($key in $SECHEAD.Keys) { $sc = $key.Split('/')[1]; $SECHEAD[$key].lbl.Text = (T ('sec' + $sc.Substring(0, 1).ToUpper() + $sc.Substring(1))) }
    foreach ($kind in $KINDS) { $rows[$kind.key].cap.Text = (T $kind.key); $rows[$kind.key].bad.Text = (T 'badge') }
    $btnApply.Text = (T 'apply'); $btnRemove.Text = (T 'removeAll'); $btnClose.Text = (T 'close'); $btnRevert.Text = (T 'revert')
    $lblModsHint.Text = (T 'modsHint'); $btnModAdd.Text = (T 'modAdd'); $btnModOpen.Text = (T 'modOpen'); $btnModRescan.Text = (T 'modRescan')
    $lvMods.Columns[0].Text = (T 'colMod')
    $lblModItemCap.Text = (T 'modItemCap'); $btnModRename.Text = (T 'extRename'); $btnModRemove.Text = (T 'extRemove'); $btnModImport.Text = (T 'modImport')
    Update-TabStrip
    Fill-Combos
}
function Update-Status {
    # 今の ~mods の状態に合わせる (ドロップダウンは今置かれている物、保留の変更は捨てる)
    if (-not $script:gameRoot) {
        $txtGame.Text = ''; $lblStVal.Text = [string][char]0x25CF + ' ' + (T 'notFound'); $lblStVal.ForeColor = $C_WARN; $script:installed = @{}; $script:oldNames = 0
    } else {
        $txtGame.Text = $script:gameRoot; $lblStVal.Text = [string][char]0x25CF + ' ' + (T 'found'); $lblStVal.ForeColor = $C_OK
        $pref = @{}; foreach ($k in $KINDS) { $pref[$k.key] = [string]$ini['sel_' + $k.key] }
        $script:installed = Get-Installed $script:gameRoot $pref
        # v1.1 (10-02 夜): 置いてある取り込んだ MOD (と互換の部分の相手) を選択肢に出さない設定にしていたら、出す設定に戻す
        $unh = @()
        foreach ($iv in @($script:installed.Values)) {
            $iv = [string]$iv
            if ($iv.StartsWith('ext:') -and (Test-ExtHidden $iv.Substring(4))) { $unh += $iv.Substring(4) }
            if ($iv.StartsWith('part:')) { foreach ($c in @(Get-CompatMods)) { foreach ($pt in @($c.parts)) { if ($pt.opt -eq $iv) { $cs0 = Get-CompatSource $c; if ($cs0 -and (Test-ExtHidden $cs0.name)) { $unh += $cs0.name } } } } }
        }
        if ($unh.Count -gt 0) { foreach ($n in $unh) { Set-ExtHidden $n $false }; Fill-Combos }
        $script:oldNames = @(Get-OldNameBoxes (Get-PaksDir $script:gameRoot)).Count
        if ($script:oldNames -gt 0) { $lblMsg.ForeColor = $C_CHGT; $lblMsg.Text = (T 'oldNames'); $tip.SetToolTip($lblMsg, $lblMsg.Text) }      # v1.0.1: v1.0 の前の名前の箱 → 適用で置き直す
        $script:syncing = $true
        try {
            foreach ($kind in $KINDS) {
                $r = $rows[$kind.key]; $v = [string]$script:installed[$kind.key]
                if ($ini.ContainsKey('sel_' + $kind.key)) { $v = [string]$ini['sel_' + $kind.key] }
                # v1.0.1: 置いてある箱が今の modules のどれとも合わない (更新で中身が変わった前の版の箱など) ときは、選んでいた物を出す。
                #   「バニラ」と出すと、そのまま適用した人の体型・髭が外れてしまう。今の状態 (?) と違うので変更として数え、適用で新しい中身を置く
                if ($v -eq '?' -and $pref[$kind.key] -and (@($r.opts) -contains $pref[$kind.key])) { $v = $pref[$kind.key] }
                $idx = 0; if ($v -and $v -ne '?') { $i = [array]::IndexOf(@($r.opts), $v); if ($i -ge 0) { $idx = $i + 1 } }
                $r.cmb.SelectedIndex = $idx
            }
        } finally { $script:syncing = $false }
    }
    if (-not $script:gameRoot) {
        $script:syncing = $true
        try { foreach ($kind in $KINDS) { $r = $rows[$kind.key]; $j = [array]::IndexOf(@($r.opts), [string]$ini['sel_' + $kind.key]); $r.cmb.SelectedIndex = $j + 1 } } finally { $script:syncing = $false }
    }
    $inst = $(if ($script:gameRoot) { @(Get-ExtInstalled $script:gameRoot) } else { @() })
    $script:extOnPending = @(@(Get-ExtMods) | Where-Object { -not $_.main -and ($inst -contains $_.name) } | ForEach-Object { $_.name })
    $script:modPending = @{}
    Fill-Mods
    Layout-Tabs
    foreach ($tk in $CHAR_TABS) { if (-not $PANES[$tk].focus) { $fk = @($KINDS | Where-Object { $_.tab -eq $tk } | Select-Object -First 1); if ($fk.Count) { $PANES[$tk].focus = $fk[0].key } }; $PANES[$tk].dirty = $true }
    Ensure-TabView
    Refresh-States
}
function Ensure-TabView {
    # 見えているタブの画像の一覧と大きい見本だけ作る (隠れたタブは開いたときに。起動を軽く)
    foreach ($tk in $CHAR_TABS) {
        if ($tabs.SelectedTab -ne $TABPAGES[$tk]) { continue }
        $pn = $PANES[$tk]
        if ($pn.dirty) { $pn.dirty = $false; Fill-Gallery $tk; if ($pn.focus) { Show-Preview $pn.focus } }
    }
}
function Refresh-All {
    Reset-ExtCache; Reset-DirCache; Forget-Images
    Fill-Combos; Update-Status; Layout-All
}
function Add-ExtPaths($paths) {
    $added = @(); $none = @(); $withPrev = @()
    $script:extNoTool = @(); $script:extNoKind = @()
    $replaced = $false
    foreach ($p in @($paths)) {
        $nm = Get-ImportName $p
        if (Test-Path -LiteralPath (Join-Path $EXT_DIR $nm)) {
            if (Ask-YesNo ([string]::Format((T 'importExists'), $nm))) {
                # 置き換える: 前の版の箱は ~mods から外しておく (箱の名前が変わっても古い物が残らないように。置き直すのは「適用」)
                $old = Get-ExtByName $nm
                if ($old -and $script:gameRoot) { try { foreach ($b in $old.boxes) { Remove-Box (Get-PaksDir $script:gameRoot) $b } } catch { } }
                $replaced = $true
            } else { $nm = Get-FreeExtName $nm }
        }
        $n = ''
        try { $n = Import-ExtPath $p $nm } catch { Show-Warn ((T 'msgMoveFail') + $p + [Environment]::NewLine + $_.Exception.Message) }
        if ($n) {
            foreach ($nn in @($n)) {      # v1.1 (10-02 分家): 版が複数の書庫は名前が複数
                $added += $nn
                if ($script:extPreviews -and $script:extPreviews[$nn]) { $withPrev += $nn }
                Forget-Images (Join-Path (Join-Path $EXT_DIR $nn) 'preview.png')          # v0.14.2: 取り込み直しで見本が替わったとき、覚えた古い画像を捨てる
            }
        } elseif ($script:extNoTool -notcontains $p) { $none += $p }
    }
    Reset-ExtCache; Fill-Combos
    if ($replaced) { Update-Status } else { Fill-Mods; Refresh-States }
    Layout-All
    if ($script:extNoTool.Count -gt 0) { [void][System.Windows.Forms.MessageBox]::Show((T 'msgNoExtractor') + [Environment]::NewLine + ($script:extNoTool -join [Environment]::NewLine), $PRODUCT) }
    if ($none.Count -gt 0) { [void][System.Windows.Forms.MessageBox]::Show((T 'msgExtNothing') + [Environment]::NewLine + ($none -join [Environment]::NewLine), $PRODUCT) }
    if ($added.Count -gt 0) {
        $tabs.SelectedTab = $tabMods
        foreach ($it in $lvMods.Items) { if ([string]$it.Tag -eq ('ext:' + $added[-1])) { $it.Selected = $true; $it.EnsureVisible() } }
        $lblMsg.ForeColor = $C_OK; $lblMsg.Text = (T 'modAdded') + ((@($added | ForEach-Object { if ($withPrev -contains $_) { $_ + (T 'modAddedPreview') } else { $_ } })) -join ', ')
    }
}
function Auto-Scope($kindKey) {
    # 服を選んだら、同じ人の「体の場面」を「全部の場面」にする (体の場面が「裸の場面だけ」のときだけ。戻すのは本人に任せる)
    if ($script:syncing) { return }
    $kd = Kind-Of $kindKey
    if ($kd -and -not $kd.scope) {
        # v1.1: 体型を ELSB にして、同じ人の服に互換のある MOD を選んでいるとき → その服の項目で同じことをする (互換は全部の場面のときに使う)
        foreach ($ok in @($KINDS | Where-Object { $_.scope -and (Kind-Of $_.scope).needs -eq $kindKey })) {
            $ri = $rows[$ok.key].cmb.SelectedIndex
            if ($ri -le 0) { continue }
            $ov = [string]$rows[$ok.key].opts[$ri - 1]
            if (-not $ov.StartsWith('ext:')) { continue }
            $oe = Get-ExtByName $ov.Substring(4)
            if ($oe -and (Get-CompatFor $oe (Get-RawSelection) $false)) { Auto-Scope $ok.key }
        }
        return
    }
    if (-not $kd -or -not $kd.scope) { return }
    if ($rows[$kindKey].cmb.SelectedIndex -le 0) { return }
    $sr = $rows[$kd.scope]
    if ($sr.cmb.SelectedIndex -gt 0) { return }
    $j = [array]::IndexOf(@($sr.opts), 'all')
    if ($j -ge 0) { $sr.cmb.SelectedIndex = $j + 1 }
}

# ---- 操作 ----
foreach ($kind in $KINDS) {
    $cb = $rows[$kind.key].cmb
    $cb.Add_SelectedIndexChanged({ param($s, $e2) if ($script:syncing) { return }; if (-not (Accept-SharedControl $s)) { return }; Auto-Scope $s.Tag; Set-Focus $s.Tag; Refresh-States; Sync-ModChecks })
    $cb.Add_DropDown({ param($s, $e2) Set-Focus $s.Tag })
    $cb.Add_Enter({ param($s, $e2) Set-Focus $s.Tag })
    $rows[$kind.key].cap.Add_Click({ param($s, $e2) Set-Focus $s.Tag })
}
$lvMods.Add_ItemChecked({ param($s, $e2)
    if ($script:fillingMods) { return }
    $m = $script:modEntries | Where-Object { $_.id -eq [string]$e2.Item.Tag } | Select-Object -First 1
    if (-not $m) { return }
    $want = [bool]$e2.Item.Checked
    if ($m.type -eq 'ext') {
        $e = $m.ext
        if ($e.main) {
            # v1.1 (10-02 夜): チェック = その項目の選択肢に出す。外すと選択肢から消し、選んでいたら元に戻す (「適用」で外れる)。互換の部分 (マラトの性器) も同じ
            Set-ExtHidden $e.name (-not $want)
            if (-not $want) {
                $r = $rows[$e.main]; $v = 'ext:' + $e.name
                if ($r.cmb.SelectedIndex -gt 0 -and [string]$r.opts[$r.cmb.SelectedIndex - 1] -eq $v) { $r.cmb.SelectedIndex = 0 }
                foreach ($c in @(Get-CompatMods)) { $cs0 = Get-CompatSource $c; if (-not $cs0 -or $cs0.name -ne $e.name) { continue }; foreach ($pt in @($c.parts)) { if (-not $pt.item) { continue }; $pr = $rows[$pt.item]; if ($pr.cmb.SelectedIndex -gt 0 -and [string]$pr.opts[$pr.cmb.SelectedIndex - 1] -eq $pt.opt) { $pr.cmb.SelectedIndex = 0 } } }
            }
            Fill-Combos
        } else {
            if ($want) { if ($script:extOnPending -notcontains $e.name) { $script:extOnPending += $e.name } } else { $script:extOnPending = @($script:extOnPending | Where-Object { $_ -ne $e.name }) }
        }
    } else {
        if ($want -eq [bool]$m.on) { [void]$script:modPending.Remove($m.id) } else { $script:modPending[$m.id] = $want }
    }
    Refresh-States
    Update-ModRowInfo      # v1.1 (10-02 夜): 有効・無効で互換の表記も変わる
    if ($e2.Item.Selected) { Show-ModDetail }
    $lvMods.Invalidate()
})
$lvMods.Add_SelectedIndexChanged({ Show-ModDetail; Layout-Tabs; $lvMods.Invalidate() })
$cmbModItem.Add_SelectedIndexChanged({
    if ($script:fillingMods) { return }
    $m = Selected-Mod
    if (-not $m -or $m.type -ne 'ext') { return }
    $wasOn = Get-ModDesired $m
    $i = $cmbModItem.SelectedIndex
    $nk = $(if ($i -le 0) { '' } else { [string](@(Get-ExtItemChoices $m.ext))[$i - 1] })
    if ($nk -eq $m.ext.main) { return }
    Set-ExtMain $m.ext $nk
    if ($nk) { $script:extOnPending = @($script:extOnPending | Where-Object { $_ -ne $m.name }) }      # 項目のある MOD は項目の選択で置く (チェックだけの予定に残さない)
    if ($m.ext.main) { $r = $rows[$m.ext.main]; if ($r.cmb.SelectedIndex -gt 0 -and [string]$r.opts[$r.cmb.SelectedIndex - 1] -eq ('ext:' + $m.name)) { $script:syncing = $true; try { $r.cmb.SelectedIndex = 0 } finally { $script:syncing = $false } } }
    Reset-ExtCache; Fill-Combos
    $e = Get-ExtByName $m.name
    if ($wasOn -and $e) {
        if ($e.main) { $r = $rows[$e.main]; $j = [array]::IndexOf(@($r.opts), 'ext:' + $e.name); if ($j -ge 0) { $r.cmb.SelectedIndex = $j + 1 } }
        elseif ($script:extOnPending -notcontains $e.name) { $script:extOnPending += $e.name }
    }
    Fill-Mods; Refresh-States; Layout-All
})
function Restore-Selection($sel, $mp, $eo) {
    # v1.1 (10-02 夜): 保留の選択と MOD 管理のチェックの保留を戻す (言語を替えたとき。前は Update-Status で黙って消えていた)。自動の動き (Auto-Scope など) は起こさない
    $script:syncing = $true
    try {
        foreach ($kind in $KINDS) {
            $r = $rows[$kind.key]; $v = [string]$sel[$kind.key]
            $idx = 0; if ($v) { $i = [array]::IndexOf(@($r.opts), $v); if ($i -ge 0) { $idx = $i + 1 } }
            if ($r.cmb.SelectedIndex -ne $idx) { $r.cmb.SelectedIndex = $idx }
        }
    } finally { $script:syncing = $false }
    $script:modPending = $mp; $script:extOnPending = @($eo)
    foreach ($tk in $CHAR_TABS) { $PANES[$tk].dirty = $true }
    Ensure-TabView; Refresh-States; Sync-ModChecks
}
$cmbLang.Add_SelectedIndexChanged({
    $script:lang = $(if ($cmbLang.SelectedIndex -eq 0) { 'ja' } else { 'en' })
    $keepSel = $null; $keepMp = @{}; $keepEo = @()
    if ($script:initDone) { $keepSel = Get-RawSelection; if ($script:modPending) { $keepMp = $script:modPending.Clone() }; $keepEo = @($script:extOnPending) }
    Update-Texts; Update-Status
    if ($keepSel) { Restore-Selection $keepSel $keepMp $keepEo }
    Layout-All; if (-not $script:noSave) { $ini['lang'] = $script:lang; Write-Ini $ini }
})
$btnBrowse.Add_Click({
    $dlg = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dlg.ShowDialog($form) -eq [System.Windows.Forms.DialogResult]::OK) {
        $r = Resolve-GameRoot $dlg.SelectedPath
        if (-not $r) { [void][System.Windows.Forms.MessageBox]::Show((T 'msgExeNotFound'), $PRODUCT); return }
        $script:gameRoot = $r; $ini['game'] = $r; Write-Ini $ini; Update-Status
    }
})
$btnModAdd.Add_Click({
    $dlg = New-Object System.Windows.Forms.OpenFileDialog
    $dlg.Filter = 'MOD (*.zip;*.rar;*.7z;*.pak;*.utoc;*.ucas)|*.zip;*.rar;*.7z;*.pak;*.utoc;*.ucas|*.*|*.*'; $dlg.Multiselect = $true
    if ($dlg.ShowDialog($form) -eq [System.Windows.Forms.DialogResult]::OK) { Add-ExtPaths $dlg.FileNames }
})
$btnModOpen.Add_Click({
    if (-not $script:gameRoot) { return }
    $p = Get-PaksDir $script:gameRoot
    if (-not (Test-Path -LiteralPath $p)) { New-Item -ItemType Directory -Path $p -Force | Out-Null }
    Start-Process -FilePath 'explorer.exe' -ArgumentList ('"' + $p + '"')
})
$btnModRescan.Add_Click({ $script:assetCache = @{}; Refresh-All })
$btnModRemove.Add_Click({
    $m = Selected-Mod
    if (-not $m -or $m.type -ne 'ext') { return }
    if ($script:gameRoot -and (Test-GameRunning)) { Show-Warn (T 'msgRunning'); return }
    $fromMods = Test-Path -LiteralPath (Join-Path $m.ext.dir $FROM_MODS_FILE)      # v1.1.1: ~mods から取り込んだ MOD
    if (-not (Ask-YesNo ([string]::Format($(if ($fromMods) { T 'confirmRemoveExtMods' } else { T 'confirmRemoveExt' }), $m.name)))) { return }
    try {
        if ($script:gameRoot -and $fromMods) {
            # v1.1.1: 取り込む前に戻す。~mods に置いてあれば元の名前のまま残す (ELSB が付けた 0ELSB_Skin_ の名前だけなら元の名前に戻す)。
            #   置いていなければ、ELSB の写しを ELSB_DisabledMods へ写して残す (消さない)
            $paks = Get-PaksDir $script:gameRoot; $off = Get-DisabledDir $script:gameRoot
            foreach ($b in $m.ext.boxes) {
                $pre = $OVL_PREFIX + $b
                $hasO = Test-Path -LiteralPath (Join-Path $paks ($b + '.ucas')); $hasP = Test-Path -LiteralPath (Join-Path $paks ($pre + '.ucas'))
                if (-not $hasO -and $hasP) { foreach ($x in '.pak', '.ucas', '.utoc') { $s0 = Join-Path $paks ($pre + $x); $d0 = Join-Path $paks ($b + $x); if ((Test-Path -LiteralPath $s0) -and -not (Test-Path -LiteralPath $d0)) { Move-Item -LiteralPath $s0 -Destination $d0 } }; $hasO = $true }
                elseif ($hasO -and $hasP) { Remove-Box $paks $pre }
                if (-not $hasO) {
                    if (-not (Test-Path -LiteralPath $off)) { New-Item -ItemType Directory -Path $off -Force | Out-Null }
                    foreach ($x in '.pak', '.ucas', '.utoc') { $s0 = Join-Path $m.ext.dir ($b + $x); $d0 = Join-Path $off ($b + $x); if ((Test-Path -LiteralPath $s0) -and -not (Test-Path -LiteralPath $d0)) { Copy-Item -LiteralPath $s0 -Destination $d0 } }
                }
            }
        }
        elseif ($script:gameRoot) { $paks = Get-PaksDir $script:gameRoot; foreach ($b in $m.ext.boxes) { foreach ($v in @(Get-ExtBoxVariants $b)) { Remove-Box $paks $v } } }
        Remove-Item -LiteralPath $m.ext.dir -Recurse -Force
    } catch { Show-Warn ((T 'msgMoveFail') + $_.Exception.Message) }
    $script:extOnPending = @($script:extOnPending | Where-Object { $_ -ne $m.name })
    if (Test-ExtHidden $m.name) { Set-ExtHidden $m.name $false }      # v1.1 (10-02 夜): 消した MOD の出さない設定は残さない
    Refresh-All
})
$btnModImport.Add_Click({
    # v1.1.1 (本人「懸念点は全て払拭したい」): ~mods に直接入っている MOD を、~mods の箱から取り込む (元の zip が無くてもよい)。
    #   名前は ELSB 対応なら互換の名前 (「(ELSB fit)」を除く)、ほかは箱の名前 (_P を除く)。~mods のファイルはそのまま (取り込んだ MOD が置いた物として扱う)
    $m = Selected-Mod
    if (-not $m -or $m.type -ne 'paks' -or $m.family) { return }
    $ec = Get-CompatOfEntry $m
    $nm = $(if ($ec) { [string]$ec.title -replace '\s*\(ELSB fit\)$', '' } else { [string]$m.name -replace '_P$', '' })
    $nm = ($nm -replace '[\\/:*?"<>|]', '_').Trim(); if (-not $nm) { $nm = 'mod' }
    if (Test-Path -LiteralPath (Join-Path $EXT_DIR $nm)) { $nm = Get-FreeExtName $nm }
    if (-not (Ask-YesNo ([string]::Format((T 'confirmImportMods'), $m.name)))) { return }
    $pak = @(@($m.files) | Where-Object { ([string]$_).ToLowerInvariant().EndsWith('.pak') })
    if ($pak.Count -eq 0) { return }
    $n = ''
    try { $n = Import-ExtPath ([string]$pak[0]) $nm } catch { Show-Warn ((T 'msgMoveFail') + $_.Exception.Message); return }
    if (-not $n) { Show-Warn ((T 'msgExtNothing') + [string]$pak[0]); return }
    foreach ($nn in @($n)) { try { [IO.File]::WriteAllText((Join-Path (Join-Path $EXT_DIR $nn) $FROM_MODS_FILE), [string]$m.name) } catch { } }
    Reset-ExtCache; Fill-Combos; Update-Status      # 今の ~mods の状態に合わせる (取り込んだ MOD がその項目で選ばれた形になる)
    Layout-All
    $tabs.SelectedTab = $tabMods
    foreach ($it in $lvMods.Items) { if ([string]$it.Tag -eq ('ext:' + @($n)[0])) { $it.Selected = $true; $it.EnsureVisible() } }
    $lblMsg.ForeColor = $C_OK; $lblMsg.Text = (T 'modAdded') + (@($n) -join ', ')
})
function Ask-YesNo($text) {
    # はい / いいえ の確認 (既定は「いいえ」)。画面の検査ではこの関数を差し替えて答えを決める
    return ([System.Windows.Forms.MessageBox]::Show($form, [string]$text, $PRODUCT, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question, [System.Windows.Forms.MessageBoxDefaultButton]::Button2) -eq [System.Windows.Forms.DialogResult]::Yes)
}
function Show-Warn($text) { [void][System.Windows.Forms.MessageBox]::Show($form, [string]$text, $PRODUCT, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning) }
function Ask-Text($title, $default) {
    # 小さな入力窓。返り値: 文字列 (キャンセルは $null)
    $f = New-Object System.Windows.Forms.Form
    $f.Text = $title; $f.ClientSize = New-Object System.Drawing.Size(540, 116); $f.FormBorderStyle = 'FixedDialog'; $f.MaximizeBox = $false; $f.MinimizeBox = $false
    $f.StartPosition = 'CenterParent'; $f.BackColor = $C_BG; $f.ForeColor = $C_TEXT; $f.Font = $F_BASE
    $tb = New-Object System.Windows.Forms.TextBox; $tb.SetBounds(16, 16, 508, 28)
    $tb.BackColor = $C_PANEL; $tb.ForeColor = $C_TEXT; $tb.BorderStyle = 'FixedSingle'; $tb.Text = $default
    $ok = New-Button 'OK' $C_ACC; $ok.SetBounds(314, 64, 100, 34); $ok.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $cancel = New-Button 'Cancel' $C_PANEL; $cancel.SetBounds(424, 64, 100, 34); $cancel.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $f.Controls.AddRange(@($tb, $ok, $cancel)); $f.AcceptButton = $ok; $f.CancelButton = $cancel
    $tb.SelectAll()
    if ($f.ShowDialog($form) -eq [System.Windows.Forms.DialogResult]::OK) { return $tb.Text }
    return $null
}
$btnModRename.Add_Click({
    $m = Selected-Mod
    if (-not $m -or $m.type -ne 'ext') { return }
    $new = Ask-Text (T 'msgRenameTitle') $m.name
    if ($null -eq $new) { return }
    $raw = Get-RawSelection
    $r = Rename-ExtMod $m.ext $new
    if ($r -eq 'exists') { [void][System.Windows.Forms.MessageBox]::Show((T 'msgRenameExists') + $new, $PRODUCT); return }
    if (-not $r) { return }
    foreach ($kind in $KINDS) {
        if ([string]$raw[$kind.key] -eq ('ext:' + $m.name)) { $raw[$kind.key] = 'ext:' + $r }
        if ($ini['sel_' + $kind.key] -eq ('ext:' + $m.name)) { $ini['sel_' + $kind.key] = 'ext:' + $r }
    }
    $script:extOnPending = @($script:extOnPending | ForEach-Object { if ($_ -eq $m.name) { $r } else { $_ } })
    if (Test-ExtHidden $m.name) { $script:extHidden = @(@($script:extHidden) | ForEach-Object { if ($_ -eq $m.name) { $r } else { $_ } }); $ini['ext_hidden'] = (@($script:extHidden) -join '|') }      # v1.1 (10-02 夜)
    Write-Ini $ini
    Reset-ExtCache; Fill-Combos
    $script:syncing = $true
    try { foreach ($kind in $KINDS) { $o = $rows[$kind.key]; $j = [array]::IndexOf(@($o.opts), [string]$raw[$kind.key]); $o.cmb.SelectedIndex = $(if ($j -ge 0) { $j + 1 } else { 0 }) } } finally { $script:syncing = $false }
    Fill-Mods; Refresh-States; Layout-All
    foreach ($it in $lvMods.Items) { if ([string]$it.Tag -eq ('ext:' + $r)) { $it.Selected = $true } }
})
$dragEnter = { param($s, $e2) if ($e2.Data.GetDataPresent([System.Windows.Forms.DataFormats]::FileDrop)) { $e2.Effect = [System.Windows.Forms.DragDropEffects]::Copy } }
$picDrop = {
    param($s, $e2)
    $files = [string[]]$e2.Data.GetData([System.Windows.Forms.DataFormats]::FileDrop)
    $imgs = @($files | Where-Object { @('.png', '.jpg', '.jpeg', '.bmp', '.webp') -contains ([IO.Path]::GetExtension($_)).ToLowerInvariant() })
    if ($imgs.Count -eq 0) { Add-ExtPaths $files; return }           # 画像でなければ MOD の取り込みと同じ
    $tabOf = 'coen'; foreach ($tk in $PANES.Keys) { if ($PANES[$tk].pic -eq $s -or $PANES[$tk].lbl -eq $s) { $tabOf = $tk } }
    $k = $PANES[$tabOf].focus
    if (-not $k) { return }
    $r = $rows[$k]; $i = $r.cmb.SelectedIndex
    $o = $(if ($i -gt 0) { [string]$r.opts[$i - 1] } else { '' })
    $dst = Set-Preview $k $o $imgs[0]
    if ($dst) { Forget-Images $dst; Fill-Gallery $tabOf; Show-Preview $k; $lblMsg.ForeColor = $C_OK; $lblMsg.Text = (T 'previewSet') + (T $k) + ': ' + $(if ($o) { Option-Name $k $o } else { First-Label $k }) }
    else { $lblMsg.ForeColor = $C_WARN; $lblMsg.Text = (T 'previewBad') + [IO.Path]::GetFileName($imgs[0]); $tip.SetToolTip($lblMsg, $lblMsg.Text) }      # v0.14.3: 読めない画像 (WebP の部品が無いなど)
}
foreach ($pv in $PANES.Values) { foreach ($ctl in @($pv.pic, $pv.lbl)) { $ctl.AllowDrop = $true; $ctl.Add_DragEnter($dragEnter); $ctl.Add_DragDrop($picDrop) } }
$dragDrop = { param($s, $e2) Add-ExtPaths ([string[]]$e2.Data.GetData([System.Windows.Forms.DataFormats]::FileDrop)) }
foreach ($ctl in @($form, $tabs, $tabCoen, $tabAnca, $tabLacra, $tabMarat, $tabMods, $lvMods, $lblModsHint) + @($NOTES.Values) + @($LEFTS.Values)) {
    $ctl.AllowDrop = $true
    $ctl.Add_DragEnter($dragEnter)
    $ctl.Add_DragDrop($dragDrop)
}
$btnApply.Add_Click({
    if (-not $script:gameRoot) { Show-Warn (T 'notFound'); return }
    if (Test-GameRunning) { Show-Warn (T 'msgRunning'); return }
    # v1.1.1 (本人「体に合わせた版が外れる適用の前に確認の窓を」): 取り込まれていない MOD の体に合わせた版が ~mods にあれば、外す前に確かめる
    $orph = @(Get-OrphanCompat $script:gameRoot)
    if ($orph.Count -gt 0 -and -not (Ask-YesNo ([string]::Format((T 'confirmOrphanCompat'), ($orph -join [Environment]::NewLine))))) { return }
    $raw = Get-RawSelection
    $sel = Current-Selection
    $script:extOnPending = @($script:extOnPending | Where-Object { $e0 = Get-ExtByName $_; $e0 -and -not $e0.main })     # チェックだけで置くのは項目の無い MOD だけ
    $lblMsg.ForeColor = $C_DIM; $lblMsg.Text = (T 'applying'); $form.Cursor = [System.Windows.Forms.Cursors]::WaitCursor; $form.Refresh()
    $err = ''; $reset = @(); $fail = @(); $conf = @()
    try {
        $reset = @(Apply-Selection $script:gameRoot $sel @($script:extOnPending))
        # ほかの MOD の有効・無効 (Paks の外へ移す / 戻す。消さない・上書きしない)
        foreach ($id in @($script:modPending.Keys)) {
            $m = $script:modEntries | Where-Object { $_.id -eq $id } | Select-Object -First 1
            if (-not $m) { continue }
            try { $rr = Set-ModEnabled $script:gameRoot $m ([bool]$script:modPending[$id]); if ($rr) { $conf += ($m.name + ' (' + ([string]$rr).Substring(7) + ')') } } catch { $fail += $m.name }
        }
        foreach ($kind in $KINDS) { $ini['sel_' + $kind.key] = [string]$raw[$kind.key] }
        $ini['ext_on'] = ($script:extOnPending -join ',')
        Write-Ini $ini
    } catch { $err = $_.Exception.Message }
    finally { $form.Cursor = [System.Windows.Forms.Cursors]::Default }
    Update-Status
    if ($err) {
        $lblMsg.ForeColor = $C_WARN; $lblMsg.Text = (T 'applyFailed') + $err; $tip.SetToolTip($lblMsg, $lblMsg.Text)
        Show-Warn ((T 'applyFailed') + $err + [Environment]::NewLine + [Environment]::NewLine + (T 'applyFailedNote'))
        return
    }
    $needs = @($reset | Where-Object { -not ([string]$_).StartsWith('pair:') -and -not ([string]$_).StartsWith('compat:') -and -not ([string]$_).StartsWith('compatdt:') }); $pairs = @($reset | Where-Object { ([string]$_).StartsWith('pair:') } | ForEach-Object { ([string]$_).Substring(5) })
    $cLose = @($reset | Where-Object { ([string]$_).StartsWith('compat:') } | ForEach-Object { $cid = ([string]$_).Substring(7); $ct = $cid; foreach ($c in @(Get-CompatMods)) { if ($c.id -eq $cid) { $ct = $c.title } }; $ct })      # v1.1: 相手の箱の名前が先で使えなかった互換
    $cOld = @($reset | Where-Object { ([string]$_).StartsWith('compatdt:') } | ForEach-Object { $cid = ([string]$_).Substring(9); $ct = $cid; foreach ($c in @(Get-CompatMods)) { if ($c.id -eq $cid) { $ct = $c.title } }; $ct })      # 10-02: ELSB の服の表が変わり、写しが合わず使えなかった互換
    $lblMsg.ForeColor = $C_OK
    $lblMsg.Text = (T 'applied') + $(if ($needs.Count) { '   ' + (T 'needsSkipped') + (($needs | ForEach-Object { T $_ }) -join ', ') } else { '' }) + $(if ($pairs.Count) { '   ' + (T 'pairSkipped') + (($pairs | ForEach-Object { T $_ }) -join ', ') } else { '' }) + $(if ($cLose.Count) { '   ' + (T 'compatSkipped') + ($cLose -join ', ') } else { '' }) + $(if ($cOld.Count) { '   ' + (T 'compatDtSkipped') + ($cOld -join ', ') } else { '' })
    if ($fail.Count) { $lblMsg.ForeColor = $C_WARN; $lblMsg.Text += '   ' + (T 'msgMoveFail') + ($fail -join ', ') }
    if ($conf.Count) { $lblMsg.ForeColor = $C_WARN; $lblMsg.Text += '   ' + (T 'modExists') + ($conf -join ', ') }
    $tip.SetToolTip($lblMsg, $lblMsg.Text)
})
$btnRevert.Add_Click({ $lblMsg.Text = ''; Update-Status })      # v1.0.1: 前の名前の箱の知らせを Update-Status が出すので、消すのは先
$btnRemove.Add_Click({
    if (-not $script:gameRoot) { Show-Warn (T 'notFound'); return }
    if (Test-GameRunning) { Show-Warn (T 'msgRunning'); return }
    if (-not (Ask-YesNo (T 'confirmRemoveAll'))) { return }
    $sel = @{}; foreach ($kind in $KINDS) { $sel[$kind.key] = '' }
    $err = ''
    try { [void](Apply-Selection $script:gameRoot $sel @()) } catch { $err = $_.Exception.Message }
    Update-Status
    if ($err) { $lblMsg.ForeColor = $C_WARN; $lblMsg.Text = (T 'applyFailed') + $err; Show-Warn ((T 'applyFailed') + $err + [Environment]::NewLine + [Environment]::NewLine + (T 'applyFailedNote')); return }
    $lblMsg.ForeColor = $C_OK; $lblMsg.Text = (T 'removed')
})
$btnClose.Add_Click({ $form.Close() })
# 窓の位置と大きさ (Bloodywalker v1.2.1 の Fit-ToScreen と同じ順): 表示する前に大きさを決めて真ん中に置く。
#   start /min で起動すると窓が最小化で出ることがあるので、表示された後に WindowState を Normal に戻してから前に出す
function Get-WorkArea {
    $wa = $null
    try { $wa = [System.Windows.Forms.Screen]::FromPoint([System.Windows.Forms.Cursor]::Position).WorkingArea } catch { }
    if (-not $wa) { $wa = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea }
    return $wa
}
function Place-Form($f) {
    $wa = Get-WorkArea
    # 最小の大きさは画面に入る範囲で (表示倍率の高い小さい画面でも下の「適用」が見えるように)
    if (-not $script:shotSmall) { $f.MinimumSize = New-Object System.Drawing.Size([math]::Min(1100, $wa.Width), [math]::Min(880, $wa.Height)) }      # v1.1: 740 → 880
    $w = $f.Width; $h = $f.Height
    if ($w -gt $wa.Width) { $w = $wa.Width }; if ($h -gt $wa.Height) { $h = $wa.Height }
    $script:wantClient = $f.ClientSize          # 縮める前の大きさ (Save-WinSize が使う)
    $f.Size = New-Object System.Drawing.Size($w, $h)
    $script:placedClient = $f.ClientSize
    $x = $wa.Left + [int](($wa.Width - $w) / 2); $ty = $wa.Top + [int](($wa.Height - $h) / 2)
    if ($x -lt $wa.Left) { $x = $wa.Left }; if ($ty -lt $wa.Top) { $ty = $wa.Top }
    $f.StartPosition = 'Manual'
    $f.Location = New-Object System.Drawing.Point($x, $ty)
    $script:placedAt = $f.Location
}
$script:placedAt = $null
$form.Add_Shown({
    $this.WindowState = 'Normal'
    if ($script:placedAt) { $this.Location = $script:placedAt }
    $this.TopMost = $true; $this.Activate(); $this.TopMost = $false
    $this.ActiveControl = $tabs          # 言語の選択に焦点が当たって青く光らないように
})
function Save-WinSize($f) {
    # 窓の中の大きさを設定に記録する。画面に合わせて縮めただけ (開いてから大きさを変えていない) なら、縮める前の大きさのまま (10-02 本人:
    #   小さい画面で開いて閉じると、縮めた大きさが記録され、大きい画面で開いても小さかった)
    $cs = $f.ClientSize
    if ($script:placedClient -and $script:wantClient -and $cs.Equals($script:placedClient) -and -not $cs.Equals($script:wantClient)) { $cs = $script:wantClient }
    $ini['win_w'] = [string]$cs.Width; $ini['win_h'] = [string]$cs.Height; Write-Ini $ini
}
$script:wantClient = $null; $script:placedClient = $null
$form.Add_FormClosing({
    if (-not $script:noSave -and $this.WindowState -eq 'Normal') { Save-WinSize $this }
})

Update-Texts
$r0 = $null
if ($ARG_ROOT) { $r0 = Resolve-GameRoot $ARG_ROOT }
if (-not $r0 -and $ini['game']) { $r0 = Resolve-GameRoot $ini['game'] }
if (-not $r0) { $ins = @(Find-AllInstalls); if ($ins.Count -gt 0) { $r0 = $ins[0] } }
$script:gameRoot = $r0
$ww = 0; $wh = 0; try { $ww = [int]$ini['win_w']; $wh = [int]$ini['win_h'] } catch { $ww = 0; $wh = 0 }
if ($ww -ge 640 -and $wh -ge 400) { $form.ClientSize = New-Object System.Drawing.Size($ww, $wh) }      # 画面より大きければ Place-Form で縮める
if ($Shot -and $ShotSize -match '^(\d+)x(\d+)$') { $script:shotSmall = $true; $form.MinimumSize = New-Object System.Drawing.Size(320, 240); $form.ClientSize = New-Object System.Drawing.Size([int]$Matches[1], [int]$Matches[2]) }
Update-Status
Place-Form $form
$script:initDone = $true
Layout-All
Apply-DarkParts
if ($Shot) {
    # 検査用の画面の写し (PrintWindow で本物の描画を撮る。設定は書かない)
    $script:noSave = $true
    $tabs.SelectedIndex = $ShotTab
    $form.Show(); [System.Windows.Forms.Application]::DoEvents()
    if ($ShotItem) { $sk = Kind-Of $ShotItem; if ($sk) { Set-Focus $ShotItem } }
    if ($ShotMod) { foreach ($it in $lvMods.Items) { if ([string]$it.Text -eq $ShotMod) { $it.Selected = $true } } }
    Layout-All; $form.Refresh(); [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -Milliseconds 200; [System.Windows.Forms.Application]::DoEvents()
    Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public static class ElsbShot { [DllImport("user32.dll")] public static extern bool PrintWindow(IntPtr h, IntPtr dc, uint f); }'
    $bmp = New-Object System.Drawing.Bitmap($form.Width, $form.Height)
    $g = [System.Drawing.Graphics]::FromImage($bmp); $hdc = $g.GetHdc()
    [void][ElsbShot]::PrintWindow($form.Handle, $hdc, 2)
    $g.ReleaseHdc($hdc); $g.Dispose()
    $bmp.Save($Shot, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output ('shot ' + $Shot + ' tab=' + $ShotTab + ' focus=' + $(if ($ShotItem) { $ShotItem } else { '' }) + ' mods=' + $lvMods.Items.Count)
    # 検査の数値: 左の列の縦スクロール、MOD 一覧のチェックの押せる範囲・行の高さ・列の幅 (横にはみ出さないこと)
    $lsc = @(); foreach ($tk in $CHAR_TABS) { $lsc += ($tk + '=' + $(if ($LEFTS[$tk].AutoScrollMinSize.Height -gt 0) { 'v' + $LEFTS[$tk].AutoScrollMinSize.Height + '/' + $LEFTS[$tk].ClientSize.Height } else { '-' }) + '/w' + $LEFTS[$tk].Width + '/cw' + $LEFTS[$tk].ClientSize.Width) }
    Write-Output ('left ' + ($lsc -join ' '))
    if ($lvMods.Items.Count -gt 0 -and $tabs.SelectedTab -eq $tabMods) {
        $b0 = $lvMods.Items[0].Bounds; $cy = $b0.Y + [int]($b0.Height / 2); $hxs = @()
        for ($hx = 0; $hx -lt 60; $hx++) { if ($lvMods.HitTest($hx, $cy).Location -eq [System.Windows.Forms.ListViewHitTestLocations]::StateImage) { $hxs += $hx } }
        $csum = 0; foreach ($c in $lvMods.Columns) { $csum += $c.Width }
        Write-Output ('mods stateimage x=' + $(if ($hxs.Count) { [string]$hxs[0] + '..' + [string]$hxs[-1] } else { 'none' }) + ' row=' + $b0.Height + ' cols=' + (($lvMods.Columns | ForEach-Object { $_.Width }) -join ',') + ' sum=' + $csum + ' client=' + $lvMods.ClientSize.Width)
    }
    $form.Close(); exit 0
}
[void]$form.ShowDialog()
