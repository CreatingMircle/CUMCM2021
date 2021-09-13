import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
import Tent_SSA
import random




def fit2(X):
    

    y= -2.21-1.67+0.28-1.18-0.29-0.17*X[0]+0.7 * X[1] -0.34*X[2]-0.05*X[3]-0.8153*X[4]
    print(y)
    return y


def fit(X):
    train = pd.read_csv('fit_data.csv')
    train = train.values
    result = []
    for i in train:
        y= (X[5]*np.log(abs(i[1]))+X[0])*(X[6]*np.log(abs(i[2]))+X[1])*(X[7]*np.log(abs(i[3]))+X[2])*(X[8]*np.log(abs(i[4]))+X[3])*(X[9]*np.log(abs(i[5]))+X[4])
        result.append((np.log(abs(i[0])) - y)**2)
    print(sum(result))
    return sum(result)



'''主函数 '''
#设置参数
pop = 30 #种群数量
MaxIter = 500 #最大迭代次数
dim =  10 #维度
lb = 0.3*np.ones([dim, 1]) #下边界
ub = 450*np.ones([dim, 1])#上边界
#适应度函数选择
fobj = fit


GbestScore,GbestPositon,Curve = Tent_SSA.Tent_SSA(pop,dim,lb,ub,MaxIter,fobj) 
print('最优适应度值：',GbestScore)
print('最优解：',GbestPositon)

#绘制适应度曲线
# plt.figure(1)
# plt.semilogy(Curve,'r-',linewidth=2)
# plt.xlabel('Iteration',fontsize='medium')
# plt.ylabel("Fitness",fontsize='medium')
# plt.grid()
# plt.title('Tent_SSA',fontsize='large')
# plt.show()