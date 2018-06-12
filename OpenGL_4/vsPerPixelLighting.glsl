// Phong reflection model
#version 130
in vec4 vPosition;	  // Vertex Position
in vec3 vNormal;    // Vertex Normal
in vec4 vVtxColor;  // Vertex Color

out vec3 fN;// ��X Normal �b���Y�y�ФU����V
out vec3 fL;// ��X Light Direction �b���Y�y�ФU����V
out vec3 fL2;// ��X Light Direction �b���Y�y�ФU����V
out vec3 fL3;// ��X Light Direction �b���Y�y�ФU����V
out vec3 fL4;// ��X Light Direction �b���Y�y�ФU����V

out vec3 fV;// ��X View Direction �b���Y�y�ФU����V

uniform mat4  ModelView;   // Model View Matrix
uniform mat4  Projection;  // Projection Matrix
uniform vec4  LightInView; // Light's position in View Space
uniform vec4  LightInView2; // Light's position in View Space
uniform vec4  LightInView3; // Light's position in View Space
uniform vec4  LightInView4; // Light's position in View Space
void main()
{
	vec4 vPosInView = ModelView * vPosition;
	// �ثe�w�g�H���Y�y�Ь���¦, �ҥH View ����m�N�O (0,0,0), �ҥH��m���I���N�O View Dir
	fV = -vPosInView.xyz;

	// �H�U���Ω�p��磌��i�� non-uniform scale �ɡA���� normal ���ץ��p��
	//		mat3 ITModelView = transpose(inverse(mat3(ModelView)); 
	//		vec3 vN = normalize(ITModelView * vNormal); 
	fN = (ModelView * vec4(vNormal, 0.0)).xyz;

	fL = vec3(LightInView.xyz - vPosInView.xyz);
	fL2 = vec3(LightInView2.xyz - vPosInView.xyz);
	fL3 = vec3(LightInView3.xyz - vPosInView.xyz);
	fL4 = vec3(LightInView4.xyz - vPosInView.xyz);
	gl_Position = Projection * vPosInView;
}