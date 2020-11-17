package util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * HttpServletRequestWrapper Ŭ������ HttpServletRequest �������̽��� �ӽ÷� ������ Ŭ������ �����ڰ�
 * ���ΰ�ü�� request�� ��������ʰ� ���ο� ���·� request ��ü�� ����� ����� ��� ��ӹ޴� Ŭ�����Դϴ�. Apahce
 * FileUpload ������Ʈ�� ����ϱ� ���ϰ� �����մϴ�. FileUpload API�� ����ϴ�
 * HttpServletRequestWrapper Ŭ�����μ� HttpServletRequest�� ����� API�� ����ϱ� ���� �����̴�.
 * 
 * 
 * 
 * ServletRequest �� �� �� ������ �� �� ServletRequestWrapper �� �� �� �� ����
 * HttpServletRequest �� �� request ����� �� �� �� ���� �� ���� HttpServletRequestWrapper ��
 * �� ����� UploadManager - requestWrap
 * 
 * 
 * request = requestWrap;
 * 
 * public interface HttpServletRequest extends ServletRequest
 * 
 * public class HttpServletRequestWrapper extends ServletRequestWrapper
 * implements HttpServletRequest
 * 
 * public class UploadManager extends HttpServletRequestWrapper
 */

public class UploadSaveManager extends HttpServletRequestWrapper {

	private boolean multipart = false;
	private HashMap parameterMap; // �Ϲ� <INPUT> ���±�
	private HashMap fileItemMap; // ���۵� <FILE> �±� ��ü�� ����

	/**
	 * �⺻ ������
	 * 
	 * @param request
	 * @throws FileUploadException
	 */

	public UploadSaveManager(HttpServletRequest request) throws FileUploadException {
		this(request, -1, -1, null);
	}

	/**
	 * ������
	 * 
	 * @param request        HttpServletRequest ��ü
	 * @param threshold      �޸𸮿� ������ �ִ�ũ��
	 * @param max            ���ε��� �ִ� ����ũ��
	 * @param repositoryPath ���ε� ���
	 * @throws FileUploadException
	 */

	public UploadSaveManager(HttpServletRequest request, int threshold, int max, String repositoryPath)
			throws FileUploadException {

		super(request);

		parsing(request, threshold, max, repositoryPath);
	}

	/**
	 * �Ϲ� �Է� �ʵ�� ���� �ʵ带 MAP�� ����
	 * 
	 * @param request        HttpServletRequest ��ü
	 * @param threshold      �޸𸮿� ������ �ִ�ũ��
	 * @param max            ���ε��� �ִ� ����ũ��
	 * @param repositoryPath ���ε� ���
	 * @throws FileUploadException
	 */

	private void parsing(HttpServletRequest request, int threshold, int max, String repositoryPath)
			throws FileUploadException {

		if (FileUpload.isMultipartContent(request)) {
			multipart = true;
			parameterMap = new java.util.HashMap();
			fileItemMap = new java.util.HashMap();

			DiskFileUpload diskFileUpload = new DiskFileUpload();
			if (threshold != -1) {
				diskFileUpload.setSizeThreshold(threshold);
			}

			diskFileUpload.setSizeMax(max);
			if (repositoryPath != null) {
				diskFileUpload.setRepositoryPath(repositoryPath);
			}

			java.util.List list = diskFileUpload.parseRequest(request);

			for (int i = 0; i < list.size(); i++) {
				FileItem fileItem = (FileItem) list.get(i);
				String name = fileItem.getFieldName();

				if (fileItem.isFormField()) {
					// �Ϲ� ���±׶�� ó��
					String value = fileItem.getString();
					String[] values = (String[]) parameterMap.get(name);
					if (values == null) {
						values = new String[] { value };
					} else {
						String[] tempValues = new String[values.length + 1];
						System.arraycopy(values, 0, tempValues, 0, 1);
						tempValues[tempValues.length - 1] = value;
						values = tempValues;
					}
					parameterMap.put(name, values);
				} else {
					// ���� �±׶�� ó��
					System.out.println("���� ���� �߰ߵ� �����: " + name);
					System.out.println("���� ���� �߰ߵ� ���ϸ�: " + fileItem.getName());

					// Ű: ���ϸ�, ���� ��ü
					fileItemMap.put(name, fileItem);
				}

			}

			addTo(); // request �Ӽ����� �����Ѵ�.

		}

	}

	/**
	 * ������ �����ϴ� enctype="multipart/form-data"�ΰ�� true����
	 * 
	 * @return enctype="multipart/form-data"�ΰ�� true����
	 */

	public boolean isMultipartContent() {
		return multipart;
	}

	/**
	 * �־��� �Ķ���Ϳ� ���� ���� ����
	 */

	public String getParameter(String name) {
		if (multipart) {
			String[] values = (String[]) parameterMap.get(name);
			if (values == null)
				return null;
			return values[0];
		} else
			return super.getParameter(name);
	}

	/**
	 * �Ķ������ ������ ����
	 */

	public String[] getParameterValues(String name) {
		if (multipart)
			return (String[]) parameterMap.get(name);
		else
			return super.getParameterValues(name);
	}

	/**
	 * ��ü �Ķ������ �̸��� ����
	 */

	public Enumeration getParameterNames() {
		if (multipart) {
			return new Enumeration() {
				Iterator iter = parameterMap.keySet().iterator();

				public boolean hasMoreElements() {
					return iter.hasNext();
				}

				public Object nextElement() {
					return iter.next();
				}
			};
		} else {
			return super.getParameterNames();
		}

	}

	public Map getParameterMap() {
		if (multipart)
			return parameterMap;
		else
			return super.getParameterMap();
	}

	/**
	 * ������ �Ķ���� �̸��� ���õ� FileItem�� �����մϴ�.
	 * 
	 * @param name
	 * @return
	 */

	public FileItem getFileItem(String name) {
		if (multipart)
			return (FileItem) fileItemMap.get(name);
		else
			return null;
	}

	/**
	 * �ӽ÷� ���� ���ε� ������ �����մϴ�.
	 */

	public void delete() {
		if (multipart) {
			Iterator fileItemIter = fileItemMap.values().iterator();
			while (fileItemIter.hasNext()) {
				FileItem fileItem = (FileItem) fileItemIter.next();
				fileItem.delete();
			}
		}
	}

	/**
	 * ���۰�ü ��ü�� request ��ü�� �����մϴ�.
	 */
	public void addTo() {
		super.setAttribute(UploadSaveManager.class.getName(), this);
	}

	/**
	 * request �Ӽ��� ����� FileUploadRequestWrapper�� �����մϴ�.
	 * 
	 * @param request
	 * @return
	 */

	public static UploadSaveManager getFrom(HttpServletRequest request) {
		return (UploadSaveManager) request.getAttribute(UploadSaveManager.class.getName());
	}

	/**
	 * ������ request�� ���۸� �Ӽ����� �����ϰ� ������ true�� �����մϴ�.
	 * 
	 * @param request
	 * @return
	 */

	public static boolean hasWrapper(HttpServletRequest request) {
		if (UploadSaveManager.getFrom(request) == null) {
			return false;
		} else {
			return true;
		}
	}

	// fileItem: ���۵� ���ϰ�ü
	// upDir: ������ ���丮
	public static String saveFile(FileItem fileItem, String upDir) {
		String filename = ""; // ���ε� ���ϸ�
		// ���� �±�
		System.out.println("���۵� ���ϸ�: " + fileItem.getName());

		// ���� ������ ����
		int idx = fileItem.getName().lastIndexOf("\\"); // ������ ���

		if (idx == -1) { // ���н�, ������ ���
			idx = fileItem.getName().lastIndexOf("/");
		}

		// ���� ���ϸ� ����
		filename = fileItem.getName().substring(idx + 1);

		try {
			// -----------------------------------------------
			// ��� ������ ������ ���� ��ü ����, ���� + ���ϸ�
			// -----------------------------------------------
			File uploadedFile = new File(upDir, filename);

			// �ø����� ���ϰ� ���� �̸��� �����ϸ� �ߺ����� ó��
			if (uploadedFile.exists() == true) {
				for (int k = 0; true; k++) {
					// ���ϸ� �ߺ��� ���ϱ� ���� �Ϸ� ��ȣ�� �����Ͽ�
					// ���ϸ����� ����
					uploadedFile = new File(upDir, "(" + k + ")" + filename);
					// ���յ� ���ϸ��� �������� �ʴ´ٸ�, �Ϸù�ȣ��
					// ���� ���ϸ� �ٽ� ����
					// �������� �ʴ� ���
					// !�� �̿��� false�� ��� ������ ó���ǵ��� ��ȯ
					boolean bol = uploadedFile.exists();
					if (bol == false) {
						// �������� �ʴ� ���ο� ���ϸ� Ȯ��
						// (0)abc.txt
						filename = "(" + k + ")" + filename;
						break;
					}
				}
			}

			// storage ������ ���ϸ� ����
			fileItem.write(uploadedFile);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return filename; // ���ε�� ���ϸ� ����

	}

	// ---------------------------------------------------------------
	// Fileupload ������Ʈ ���� �ڵ� ��
	// ---------------------------------------------------------------

	/**
	 * ������ �����մϴ�.
	 */

	public static boolean deleteFile(String folder, String fileName) {
		boolean ret = false;

		try {
			if (fileName != null) { // ������ ������ �����ϴ� ��� ����
				File file = new File(folder + "/" + fileName);
				ret = file.delete();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ret;

	}

	public HashMap getFileItemMap() {
		return fileItemMap;
	}

	public void setFileItemMap(HashMap fileItemMap) {
		this.fileItemMap = fileItemMap;
	}

	/**
	 * ���۹��� ������ ������ ����
	 * 
	 * @return
	 */
	public int getFileCount() {
		return this.fileItemMap.size();
	}

	// Spring
	public static String saveFileSpring30(MultipartFile multipartFile, String basePath) {
		// input form's parameter name
		String fileName = "";
		// original file name
		String originalFileName = multipartFile.getOriginalFilename();
		// file content type
		String contentType = multipartFile.getContentType();
		// file size
		long fileSize = multipartFile.getSize();

		System.out.println("fileSize: " + fileSize);
		System.out.println("originalFileName: " + originalFileName);

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			if (fileSize > 0) { // ������ �����Ѵٸ�
				// ��ǲ ��Ʈ���� ��´�.
				inputStream = multipartFile.getInputStream();
				File oldfile = new File(basePath, originalFileName);
				if (oldfile.exists()) {
					for (int k = 0; true; k++) {
						// ���ϸ� �ߺ��� ���ϱ� ���� �Ϸ� ��ȣ�� �����Ͽ�
						// ���ϸ����� ����
						oldfile = new File(basePath, "(" + k + ")" + originalFileName);
						// ���յ� ���ϸ��� �������� �ʴ´ٸ�, �Ϸù�ȣ��
						// ���� ���ϸ� �ٽ� ����
						if (!oldfile.exists()) { // �������� �ʴ� ���
							fileName = "(" + k + ")" + originalFileName;
							break;
						}
					}
				} else {
					fileName = originalFileName;
				}

				// make server full path to save
				String serverFullPath = basePath + "\\" + fileName;

				System.out.println("fileName: " + fileName);
				System.out.println("serverFullPath: " + serverFullPath);

				outputStream = new FileOutputStream(serverFullPath);

				// ���۸� �����.
				int readBytes = 0;
				byte[] buffer = new byte[8192];

				while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}

				outputStream.close();
				inputStream.close();

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return fileName;

	}

}// class end