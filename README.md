# web-app-with-docker-compose-tutorial

###### docker-composeのデモ（DockerでNginxとSpring Bootを連携）

- Nginxコンテナがポート80番で待機．
  - リバースプロキシにより，ポート8080番へ．
- Spring Bootコンテナがポート8080番で待機．
  - Nginxからのリクエストを受け，レスポンス．
- MySQLコンテナが3306番で待機．
  - 現在のところ実装はなし．
    - といいますか，設定不足で「docker-mysql exited with code 1」

###### 実行方法

```bash
# Spring Bootのビルド（targetディレクトリ配下にjarができる）
./mvnw install
# ビルド（Dockerfile，docker-composeファイル編集時は必須）
docker-compose build
# 実行（-dオプションでバックグラウンド）
docker-compose up
# 停止
docker-compose down
```



【別件おまけ】kubernetesの場合（kube配下，上記とは全く関係がない）

https://qiita.com/Kta-M/items/ce475c0063d3d3f36d5d

```bash
cd kube
# 下準備
kubectl config use-context docker-for-desktop
# docker-for-desktopとなっていることを確認
kubectl config current-context
# ローカルのみ
kubectl apply -k prepare/
# Masterの確認（Podの集まり）
kubectl get pods --namespace=kube-system
# デプロイ
kubectl apply -f ./
# 終了
kubectl delete -f ./
# Ingressの情報を取得
kubectl get ingress
# Podの情報を取得
kubectl get pods
```

