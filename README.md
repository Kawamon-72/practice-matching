# practice-matching
ER図URL：https://lucid.app/lucidchart/63f551d6-d24e-4460-8202-9db210b61a4c/edit?viewport_loc=-12404%2C-695%2C3395%2C1545%2C0_0&invitationId=inv_fdb70c90-cf0f-4c09-9ac3-709e176c2907

画面遷移図　Figma：https://www.figma.com/design/fxT281HkCc1jgIPk6fcBBx/Untitled?t=htZJXzEhUSLsIXCo-0


RUNTEQ卒業制作 練習試合のマッチング機能のアプリです。
■サービス概要
どんなサービスなのかを３行で説明してください。

練習試合の相手を探すためのマッチング機能アプリになります。
練習試合を募集している相手同士をアプリ内でマッチングさせることで練習試合をスムーズに組むことができるようになります。
これにより、試合相手を電話やDMで何回もやり取りせずに今までより簡単に練習試合をセッティングできるようになります。

■ このサービスへの思い・作りたい理由
このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。
このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。

小学校、中学校、高校は部活、社会人になってからはサークルで野球をしていました。
その中で練習試合を組むときに部活動時代は監督やコーチ、父兄の方が電話で何度も連絡をして練習試合をセッティングしてくれていました。
また、サークルになってからは、SNSのDMで練習試合のセッティングをしていました。
自分は仕事の合間を縫ってこのように何回も連絡を重ねて練習試合のセッティングをするのは大変だなとつくづく思うようになりました。
また、連絡を入れて練習試合をセッティングするとなると、顔馴染みのチームとしか毎度練習試合ができないのではないかと思うようになりました。
そこで、マッチングで練習試合のセッティングをすれば効率よく相手を見つけることができて、色々なチームと試合ができて面白いのではないかと感じました。

■ ユーザー層について
決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。

小学校のスポ少の監督や父兄、中学校、高校の部活の監督やクラブチームの監督、社会人のスポーツサークル
理由：いずれのユーザー層も仕事をしながら合間を縫って手間をかけて練習試合をセッティングしているからです。

■サービスの利用イメージ
ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。

ユーザーは練習試合の募集をすることができ、また募集に対して練習試合の申し込みをすることができます。
これにより、時間をかけずに効率的に練習試合をセッティングできるようになります。

■ ユーザーの獲得について
想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。

顔見知りのチームへ宣伝してアプリへ登録してもらうことや、SNSなどで発信して情報を流していければと思います。
また、試合をしたチームへ宣伝したりして、アプリを広めていきたいと考えています。

■ サービスの差別化ポイント・推しポイント
似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。
独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。

対戦相手を探すうえで、絞り込みがたくさんできること、特に地域を絞り込むことで、遠征もしやすくなります。
また、マッチングしたチーム同士でチャットできる機能をつけることで内容の詳細を決めることができます。

■ 機能候補
現状作ろうと思っている機能、案段階の機能をしっかりと固まっていなくても構わないのでMVPリリース時に作っていたいもの、本リリースまでに作っていたいものをそれぞれ分けて教えてください。

MVPリリース:マッチング機能、チャット機能、ログイン・ログアウト機能、パスワードリセット機能、ユーザー登録機能、友達登録機能、友達とのチャット機能
本リリース：グループ機能（ユーザーを集めてミーティング、日程調整できる機能、練習試合のマッチングもできるようにする、相手とのチャットもできるようにする、相手を友達に登録できるようにもする）、権限管理（管理者・一般ユーザーの区別）
          問い合わせ機能、利用規約、プライポリシーページ、友達登録機能、友達とのチャット機能
          

■ 機能の実装方針予定
一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。
ログイン・ログアウト機能、パスワードリセット機能、チャット機能、自動削除機能（試合終了日後マッチングデータの削除）
API連携：Google MapsAPI