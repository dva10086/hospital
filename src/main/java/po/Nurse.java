package po;

public class Nurse {
  private String Nurse_id;
  private String password;
  private String name;
  private int gender;
  private int age;
public String getNurse_id() {
	return Nurse_id;
}
public void setNurse_id(String nurse_id) {
	Nurse_id = nurse_id;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getGender() {
	return gender;
}
public void setGender(int gender) {
	this.gender = gender;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
}
