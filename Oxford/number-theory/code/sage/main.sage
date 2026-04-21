x = polygen(ZZ, 'x')
K.<a> = NumberField(x^2 + 10)

print(K.class_group().gen())

def solvethue(f,n):
    assert f.is_homogeneous()
    return gp.thue(f.subs({f.variables()[1]:1}), n).sage()

r.<u ,v> = PolynomialRing(QQ)
print( solvethue(u^3+v^3,1) )

