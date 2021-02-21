# 2 cvičení

## Domácí příprava
| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

Rovná se SoP= B&#862;<sub>1</sub>B&#862;<sub>0</sub>A&#862;<sub>1</sub>A&#862;<sub>0</sub>+B&#862;<sub>1</sub>B<sub>0</sub>A&#862;<sub>1</sub>A<sub>0</sub>+B<sub>1</sub>B&#862;<sub>0</sub>A<sub>1</sub>A&#862;<sub>0</sub>+B<sub>1</sub>B<sub>0</sub>A<sub>1</sub>A<sub>0</sub>

Menší PoS = (B<sub>1</sub>+B<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A&#862;<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B<sub>0</sub>+A<sub>1</sub>+A&#862;<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B<sub>0</sub>+A&#862;<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A<sub>1</sub>+A&#862;<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A&#862;<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;&hairsp;(B&#862;<sub>1</sub>+B&#862;<sub>0</sub>+A&#862;<sub>1</sub>+A&#862;<sub>0</sub>)

## 2-bit komparátor
### *K-mapa pro funkci A se rovná B*
|           |           |         |  **A1,A0**  |           |           |
| :-:       | :-:       | :-:     | :-:         | :-:       | :-:       | 
|           |           | **0 0** | **0 1**     | **1 1**   | **1 0**   | 
|           | **0 0**   | *1*     | 0           | 0         | 0         | 
| **B1,B0** |  **0 1**  | 0       | *1*         | 0         |  0        |
|           | **1 1**   | 0       | 0           | *1*       | 0         |
|           | **1 0**   | 0       | 0           | 0         | *1*       |



### *K-mapa pro funkci B je větší A*
|           |           |         |  **A1,A0**  |           |           |
| :-:       | :-:       | :-:     | :-:         | :-:       | :-:       | 
|           |           | **0 0** | **0 1**     | **1 1**   | **1 0**   | 
|           | **0 0**   | 0       | 0           | 0         | 0         | 
| **B1,B0** |  **0 1**  | *1*     | 0           | 0         |  0        |
|           | **1 1**   | *1*     | *1*         | 0         | *1*       |
|           | **1 0**   | *1*     | *1*         | 0         | 0         |

Větší SoP min = B<sub>1</sub>A&#862;<sub>1</sub>+B<sub>0</sub>A&#862;<sub>1</sub>A&#862;<sub>0</sub>+B<sub>0</sub>B<sub>1</sub>A&#862;<sub>0</sub>

### *K-mapa pro funkci B je menší A*
|           |           |         |  **A1,A0**  |           |           |
| :-:       | :-:       | :-:     | :-:         | :-:       | :-:       | 
|           |           | **0 0** | **0 1**     | **1 1**   | **1 0**   | 
|           | **0 0**   | *0*     | 1           | 1         | 1         | 
| **B1,B0** |  **0 1**  | *0*     | *0*         | 1         |  1        |
|           | **1 1**   | *0*     | *0*         | *0*       | *0*       |
|           | **1 0**   | *0*     | *0*         | 1         | *0*       |

Menší PoS min = (A<sub>0</sub>+A<sub>1</sub>)&hairsp;&middot;(B&#862;<sub>0</sub>+A<sub>1</sub>)&hairsp;&middot;(B&#862;<sub>1</sub>+A<sub>1</sub>)&hairsp;&middot;(B&#862;<sub>1</sub>+A<sub>0</sub>)&hairsp;&middot;(B&#862;<sub>0</sub>+B&#862;<sub>1</sub>)

### Odkaz na edaplayground

https://www.edaplayground.com/x/QEwb

