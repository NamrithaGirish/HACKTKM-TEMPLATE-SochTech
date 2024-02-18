// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:green_connect/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  Future<List<dynamic>?> getUserByID(int id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.getUserByID + id.toString());

      var response =
          await http.get(url, headers: {'ngrok-skip-browser-warning': 'true'});
      if (response.statusCode == 200) {
        print("hello");
        List<dynamic> responseBody = json.decode(response.body);
        print(responseBody.runtimeType);
        List<dynamic> user = responseBody;

        print(user[0]);
        //print(user['id']);
        return user;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<dynamic>?> getMentorByID(int id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.getUserByID + id.toString());

      var response =
          await http.get(url, headers: {'ngrok-skip-browser-warning': 'true'});
      if (response.statusCode == 200) {
        print("hello");
        Map<String, dynamic> responseBody = json.decode(response.body);
        print(responseBody.runtimeType);
        List<dynamic> user = responseBody["error"];

        print(responseBody["error"]);
        //print(user['id']);
        return user;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<dynamic>?> getPrevMent(int id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.prevCont + id.toString());

      var response =
          await http.get(url, headers: {'ngrok-skip-browser-warning': 'true'});
      if (response.statusCode == 200) {
        print("hello");
        print(response.body);
        Map<String, dynamic> responseBody = json.decode(response.body);
        print(responseBody);
        // List<dynamic> user = responseBody;

        print(responseBody["prev_mentors"]);
        //print(user['id']);
        return responseBody["prev_mentors"];
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

    Future<List<dynamic>?> getMent(int id) async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.getMentor + id.toString());
          
      var response = await http.get(url,headers:{'ngrok-skip-browser-warning':'true'} );
      if (response.statusCode == 200) {
        print("hello");
        print(response.body);
        Map<String,dynamic> responseBody = json.decode(response.body);
        print(responseBody);
       // List<dynamic> user = responseBody;
        
        print(responseBody["error"]);
        //print(user['id']);
        return responseBody["error"];
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<dynamic>> otherMentors() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.otherMentors +
          ApiConstants.id.toString());
      var response = await http.get(url,headers:{'ngrok-skip-browser-warning':'true'});
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        // List<dynamic> dynamicTeam = responseBody["other-mentors"];
        print(responseBody["other_mentors"]);

        return responseBody["other_mentors"];
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  void uploadImage(int id, File _imageFile) async {
    var uri = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.update +
        id.toString()); // Replace with your API endpoint

    var request = http.MultipartRequest('PUT', uri);

    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath(
        'image', _imageFile.path,
        contentType: MediaType('image', 'jpg')));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        // Handle success
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        // Handle failure
      }
    } catch (error) {
      print('Error uploading image: $error');
      // Handle error
    }
  }

  Future<Map<String, dynamic>?> addComment(int reciever_id, File _imageFile,
      String comment, int sender_id, String linkedin) async {
    var uri = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.addComments); // Replace with your API endpoint

    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll({
      'linkedin_url': linkedin,
      'sender_id': sender_id.toString(),
      'receiver_id': reciever_id.toString(),
      'comment': comment,
    });
    // Attach the file to the request
    request.files.add(await http.MultipartFile.fromPath(
        'image', _imageFile.path,
        contentType: MediaType('image', 'jpg')));

    try {
      var response = await http.Response.fromStream(await request.send());

      // Check the response
      Map<String, dynamic> responseBody = json.decode(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print('Data sent successfully');
        return null;
      } else {
        print('Failed to send data. Error: ${response.reasonPhrase}');
        return responseBody;
      }
    } catch (error) {
      print('Error uploading image: $error');
      // Handle error
    }
  }

  Future<List<dynamic>> allMembers(String teamName) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.teamMember + teamName);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        print(responseBody["members"].runtimeType);
        List<dynamic> members = responseBody["members"];
        print(members);
        print(members.runtimeType);
        print(members[0]["name"]);
        return members;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<dynamic>> userData(int id, String msg) async {
    try {
      final response = await http.get(Uri.parse(
          ApiConstants.baseUrl + ApiConstants.getUserByID + id.toString()));
      //print(response.body);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> sentList = data[msg];
        print(sentList);
        return sentList;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle network errors or any other exceptions
      print("Error: $error");
      throw Exception('Failed to load data');
    }
  }
}
