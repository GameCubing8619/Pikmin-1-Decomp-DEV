#ifndef _VECTOR3F_H
#define _VECTOR3F_H

#include "types.h"
#include "math.h"
#include "Stream.h"
#include "std/Math.h"

struct Matrix3f;
struct Quat;

/**
 * @brief TODO
 *
 * @note Size: 0xC.
 */
struct Vector3f {
	Vector3f() { x = y = z = 0.0f; }
	Vector3f(f32 const& _x, f32 const& _y, f32 const& _z)
	    : x(_x)
	    , y(_y)
	    , z(_z)
	{
	}

	inline Vector3f operator*(const Vector3f& other) const { return Vector3f(x * other.x, y * other.y, z * other.z); }
	void rotate(struct Matrix4f&);
	void rotateTo(Matrix4f&, Vector3f&);
	void multMatrix(Matrix4f&);
	void multMatrixTo(Matrix4f&, Vector3f&);

	inline void read(Stream& stream)
	{
		x = stream.readFloat();
		y = stream.readFloat();
		z = stream.readFloat();
	}

	inline void write(Stream& stream)
	{
		stream.writeFloat(x);
		stream.writeFloat(y);
		stream.writeFloat(z);
	}

	inline f32 distance(Vector3f& to)
	{
		Vector3f result;
		result.sub2(to, *this);
		return result.length();
	}

	inline void sub2(Vector3f& a, Vector3f& b)
	{
		f32 newZ = a.getZ() - b.getZ();
		f32 newY = a.getY() - b.getY();
		f32 newX = a.getX() - b.getX();
		set(newX, newY, newZ);
	}

	inline void set(const f32& pX, const f32& pY, const f32& pZ)
	{
		x = pX;
		y = pY;
		z = pZ;
	}

	inline void operator*=(const f32 other)
	{
		this->x *= other;
		this->y *= other;
		this->z *= other;
	}

	// NB: do NOT make an operator= definition, needs to use the default.

	inline void set(const f32 val) { x = y = z = val; }

	void div(f32); // weak

	inline f32 squaredLength() const { return x * x + y * y + z * z; }
	inline f32 length() const { return sqrtf(squaredLength()); }

	// seems good according to InteractBomb::actPiki
	inline void normalise()
	{
		f32 norm = std::sqrtf(x * x + y * y + z * z);
		if (norm != 0.0f) {
			x /= norm;
			y /= norm;
			z /= norm;
		}
	}

	const f32 getX() const { return x; }
	const f32 getY() const { return y; }
	const f32 getZ() const { return z; }

	f32 getX() { return x; }
	f32 getY() { return y; }
	f32 getZ() { return z; }

	void input(Vector3f&);

	// unused/inlined:
	void rotateTranspose(Matrix4f&);
	void rotate(Quat&);
	void rotateInverse(Quat&);

	f32 x, y, z; // _00, _04, _08
};

inline Vector3f cross(Vector3f& vec1, Vector3f& vec2)
{
	Vector3f outVec;
	outVec.x = vec1.y * vec2.z - vec1.z * vec2.y;
	outVec.y = vec1.z * vec2.x - vec1.x * vec2.z;
	outVec.z = vec1.x * vec2.y - vec1.y * vec2.x;
	return outVec;
}

/**
 * @brief TODO
 *
 * @note Size: 0x8.
 */
struct Vector2f {
	Vector2f() { }
	Vector2f(const f32& x, const f32& y);

	f32 x, y; // _00, _04
};

/**
 * @brief TODO
 *
 * @note Size: 0x10.
 */
struct Quat {
	Quat() { }

	void fromMat3f(Matrix3f&);
	void rotate(Vector3f&, f32);
	void multiply(Quat&);
	void normalise();
	void genVectorX(Vector3f&);
	void genVectorY(Vector3f&);
	void genVectorZ(Vector3f&);
	void slerp(Quat&, f32, int);
	void fromEuler(Vector3f&);

	// unused/inlined:
	void multiplyTo(Quat&, Quat&);

	inline void set(f32 _x, f32 _y, f32 _z, f32 _s)
	{
		v.x = _x;
		v.y = _y;
		v.z = _z;
		s   = _s;
	}

	Vector3f v; // _00, vector part
	f32 s;      // _0C, scalar part
};

inline Vector3f operator-(const Vector3f& a, const Vector3f& b) { return Vector3f(a.x - b.x, a.y - b.y, a.z - b.z); }
inline Vector3f operator+(const Vector3f& a, const Vector3f& b) { return Vector3f(a.x + b.x, a.y + b.y, a.z + b.z); }
inline f32 Vector3f_diffX(Vector3f& a, Vector3f& b) { return a.getX() - b.getX(); }
inline f32 Vector3f_diffY(Vector3f& a, Vector3f& b) { return a.getY() - b.getY(); }
inline f32 Vector3f_diffZ(Vector3f& a, Vector3f& b) { return a.getZ() - b.getZ(); }

#endif
