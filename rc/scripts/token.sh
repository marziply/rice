kubectl -n kube-system describe secret eks-admin-token-lpzzs | grep -Po 'token:\s+\K.*' | xclip -sel clip
