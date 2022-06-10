1. create a Dockerfile
2. build image via command "docker build -t senyss/web:1.0.0 ."
3. start container "docker run -ti --rm -p 8000:8000 --name web senyss/web:1.0.0"
	recive: "Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
		172.17.0.1 - - [10/Jun/2022 10:29:13] "GET / HTTP/1.1" 200 - " - OK
4. upload to Docker Hub "docker push senyss/web:1.0.0"
	https://hub.docker.com/repository/docker/senyss/web  - OK
5. create kubernetes manifest
6. add manifest "kubectl create -f D:\test\web.yaml"
	recive: "deployment.apps/web created"
7. check "kubectl get deployments"
	recive: "NAME   READY   UP-TO-DATE   AVAILABLE   AGE
		 web    2/2     2            2           55s"  - OK
8. get pod name "kubectl get pods"
	web-5d45d7cf44-5h4q9   1/1     Running   0          101s
	web-5d45d7cf44-t6cdn   1/1     Running   0          101s


9. "kubectl port-forward --address 0.0.0.0 pod/web-5d45d7cf44-5h4q9 8080:8000"
	"Forwarding from 0.0.0.0:8080 -> 8000
	 Handling connection for 8080"   - OK