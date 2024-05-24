function min_build_push () {
  IMAGE_NAME=$1
  IMAGE_TAG=$2
  IMAGE_FULL=$1:$2
  echo $IMAGE_FULL
  docker build -t $IMAGE_FULL . 
  minikube image load $IMAGE_FULL
  minikube image ls | grep $IMAGE_NAME
}
